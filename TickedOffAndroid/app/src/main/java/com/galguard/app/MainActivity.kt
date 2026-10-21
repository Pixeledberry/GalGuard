package com.galguard.app

import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.provider.MediaStore
import android.webkit.ValueCallback
import androidx.core.content.FileProvider
import java.io.File
import android.os.Bundle
import android.webkit.JavascriptInterface
import android.webkit.PermissionRequest
import android.webkit.WebChromeClient
import android.webkit.WebResourceRequest
import android.webkit.WebResourceResponse
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.webkit.WebViewAssetLoader
import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.codescanner.GmsBarcodeScannerOptions
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.documentscanner.GmsDocumentScannerOptions
import com.google.mlkit.vision.documentscanner.GmsDocumentScanning
import com.google.mlkit.vision.documentscanner.GmsDocumentScanningResult
import com.google.mlkit.vision.text.TextRecognition
import com.google.mlkit.vision.text.latin.TextRecognizerOptions
import com.google.mlkit.vision.codescanner.GmsBarcodeScanning
import org.json.JSONObject

class MainActivity : Activity() {
    private lateinit var web: WebView
    private var pending: PermissionRequest? = null
    private val host = "appassets.androidplatform.net"

    @SuppressLint("SetJavaScriptEnabled")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        web = WebView(this)
        setContentView(web)

        // Serves bundled files over https so the page runs in a secure context.
        val loader = WebViewAssetLoader.Builder()
            .addPathHandler("/assets/", WebViewAssetLoader.AssetsPathHandler(this))
            .build()

        web.settings.javaScriptEnabled = true
        web.settings.domStorageEnabled = true // favorites, history and settings are saved here
        web.webViewClient = object : WebViewClient() {
            override fun shouldInterceptRequest(view: WebView, request: WebResourceRequest): WebResourceResponse? =
                loader.shouldInterceptRequest(request.url)

            override fun shouldOverrideUrlLoading(view: WebView, request: WebResourceRequest): Boolean {
                if (request.url.host == host) return false
                startActivity(Intent(Intent.ACTION_VIEW, request.url)) // external links open in the browser
                return true
            }
        }
        // Lets the in-page camera view work if the built-in scanner is unavailable.
        web.webChromeClient = object : WebChromeClient() {
            // Makes "Choose photo" (gallery) and "Take photo" (camera) work for file inputs on the page.
            override fun onShowFileChooser(view: WebView, cb: ValueCallback<Array<Uri>>, params: FileChooserParams): Boolean {
                fileCb?.onReceiveValue(null)
                fileCb = cb
                try {
                    if (params.isCaptureEnabled) {
                        if (checkSelfPermission(Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED) {
                            launchCamera()
                        } else {
                            requestPermissions(arrayOf(Manifest.permission.CAMERA), 2)
                        }
                    } else {
                        startActivityForResult(params.createIntent(), reqFile)
                    }
                } catch (e: Exception) {
                    fileCb = null
                    cb.onReceiveValue(null)
                }
                return true
            }

            override fun onPermissionRequest(request: PermissionRequest) {
                runOnUiThread {
                    if (checkSelfPermission(Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED) {
                        request.grant(request.resources)
                    } else {
                        pending = request
                        requestPermissions(arrayOf(Manifest.permission.CAMERA), 1)
                    }
                }
            }
        }
        web.addJavascriptInterface(Bridge(), "Android")
        web.loadUrl("https://$host/assets/tickedoff.html")
    }

    override fun onRequestPermissionsResult(code: Int, perms: Array<out String>, results: IntArray) {
        if (code == 2) {
            if (results.firstOrNull() == PackageManager.PERMISSION_GRANTED) {
                try { launchCamera() } catch (e: Exception) { fileCb?.onReceiveValue(null); fileCb = null }
            } else {
                fileCb?.onReceiveValue(null); fileCb = null
            }
            return
        }
        val req = pending ?: return
        pending = null
        if (results.firstOrNull() == PackageManager.PERMISSION_GRANTED) req.grant(req.resources) else req.deny()
    }

    private val reqDoc = 4711
    private val reqFile = 4712
    private var fileCb: ValueCallback<Array<Uri>>? = null
    private var camUri: Uri? = null

    private fun launchCamera() {
        val dir = File(cacheDir, "photos").apply { mkdirs() }
        val f = File.createTempFile("photo_", ".jpg", dir)
        val uri = FileProvider.getUriForFile(this, "$packageName.files", f)
        camUri = uri
        val i = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
            .putExtra(MediaStore.EXTRA_OUTPUT, uri)
            .addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION or Intent.FLAG_GRANT_READ_URI_PERMISSION)
        startActivityForResult(i, reqFile)
    }

    private fun textError(message: String?) {
        web.evaluateJavascript("window.onNativeTextError && window.onNativeTextError(${JSONObject.quote(message ?: "")})", null)
    }

    @Deprecated("Deprecated in Java")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == reqFile) {
            val cb = fileCb
            fileCb = null
            var result: Array<Uri>? = null
            if (resultCode == RESULT_OK) {
                result = if (data?.data != null || data?.clipData != null) {
                    WebChromeClient.FileChooserParams.parseResult(resultCode, data)
                } else {
                    camUri?.let { arrayOf(it) }
                }
            }
            cb?.onReceiveValue(result)
            return
        }
        if (requestCode != reqDoc || resultCode != RESULT_OK) return
        val uri = GmsDocumentScanningResult.fromActivityResultIntent(data)?.getPages()?.firstOrNull()?.getImageUri()
        if (uri == null) { textError("no picture returned"); return }
        try {
            val image = InputImage.fromFilePath(this, uri)
            TextRecognition.getClient(TextRecognizerOptions.DEFAULT_OPTIONS).process(image)
                .addOnSuccessListener { text ->
                    web.evaluateJavascript("window.onNativeText(${JSONObject.quote(text.text)})", null)
                }
                .addOnFailureListener { e -> textError(e.message) }
        } catch (e: Exception) {
            textError(e.message)
        }
    }

    @Deprecated("Deprecated in Java")
    override fun onBackPressed() {
        if (web.canGoBack()) web.goBack() else super.onBackPressed()
    }

    inner class Bridge {
        @JavascriptInterface
        fun share(text: String) {
            runOnUiThread {
                val send = Intent(Intent.ACTION_SEND).apply {
                    type = "text/plain"
                    putExtra(Intent.EXTRA_TEXT, text)
                }
                startActivity(Intent.createChooser(send, "Share"))
            }
        }

        // Google's document scanner (auto-crops the page), then Google's on-device text recognition.
        @JavascriptInterface
        fun scanText(lang: String) {
            runOnUiThread {
                val options = GmsDocumentScannerOptions.Builder()
                    .setGalleryImportAllowed(true)
                    .setPageLimit(1)
                    .setResultFormats(GmsDocumentScannerOptions.RESULT_FORMAT_JPEG)
                    .setScannerMode(GmsDocumentScannerOptions.SCANNER_MODE_BASE)
                    .build()
                GmsDocumentScanning.getClient(options).getStartScanIntent(this@MainActivity)
                    .addOnSuccessListener { sender -> startIntentSenderForResult(sender, reqDoc, null, 0, 0, 0) }
                    .addOnFailureListener { e -> textError(e.message) }
            }
        }

        @JavascriptInterface
        fun scan() {
            runOnUiThread {
                val options = GmsBarcodeScannerOptions.Builder()
                    .setBarcodeFormats(
                        Barcode.FORMAT_EAN_13, Barcode.FORMAT_EAN_8,
                        Barcode.FORMAT_UPC_A, Barcode.FORMAT_UPC_E,
                        Barcode.FORMAT_QR_CODE, Barcode.FORMAT_CODE_128, Barcode.FORMAT_CODE_39
                    ).enableAutoZoom().build()
                GmsBarcodeScanning.getClient(this@MainActivity, options).startScan()
                    .addOnSuccessListener { code ->
                        val value = code.rawValue ?: code.displayValue ?: return@addOnSuccessListener
                        web.evaluateJavascript("window.onNativeScan(${JSONObject.quote(value)})", null)
                    }
                    .addOnFailureListener { e ->
                        web.evaluateJavascript("window.onNativeScanError && window.onNativeScanError(${JSONObject.quote(e.message ?: "")})", null)
                    }
            }
        }
    }
}
