# GalGuard

🍖 I want to be 100% transparent and let everyone know that this project is 100% vibe-coded. I'm just a man with an idea. I do not know how to code. AI did all of the work. 🍖

A barcode scanner that checks food ingredients for people with **alpha-gal syndrome (AGS)**. Scan a product, and GalGuard shows its ingredient list with problem ingredients highlighted in red or yellow, plus a one-glance rating.

It runs as a single static web page (`index.html`, no build step, no backend) and also ships as an Android wrapper app.

> **Disclaimer:** GalGuard is a screening aid, not medical advice. Ingredient data is crowdsourced and can be missing or wrong, and some ingredients (such as "natural flavors") never reveal their source. Always read the label and follow your allergist's guidance.

---

## Features

### Looking up products
- **Live camera scanning.** Point the camera at a barcode and it searches automatically as soon as a code is read.
- **QR codes.** QR codes that contain a product number (including GS1 Digital Link URLs) are looked up automatically. Other QR codes show a short notice and scanning continues.
- **Supported formats:** EAN-13, EAN-8, UPC-A, UPC-E, Code 128, Code 39, QR.
- **Built for distance and small codes.**
  - Requests high-resolution video with continuous autofocus.
  - If nothing is found in the full frame, it re-checks magnified center regions.
  - Shows a zoom slider on phones that support camera zoom, and gradually auto-zooms when it can't find a code.
  - When several codes are visible, the one **closest to the center** of the frame wins. Product barcodes are preferred over unrelated QR codes.
- **Photo of barcode.** Take or choose a photo if the live camera is unavailable.
- **Type the digits.** Enter a barcode manually, with a **Clear** button to reset the field and result.
- **Paste an ingredient list.** For products not in the database. A **Try a sample** button runs a made-up list so you can see the highlighting.
- **Barcode format fallbacks.** If a 12-digit UPC-A isn't found, it retries as 13-digit EAN (and vice versa, plus 14-digit codes with a leading zero).

### Ratings and highlighting
Each product gets one rating and a severity meter:

| Rating | Color | Meaning |
|---|---|---|
| **Do not eat** | Red | Contains at least one red-flagged ingredient |
| **Avoid** | Yellow | No red flags, but contains yellow-flagged ingredients |
| **Likely OK** | Green | Nothing flagged in the listed ingredients |
| **Can't tell** | Gray | No ingredient list available |

The full ingredient list appears immediately after a scan or lookup, with flagged ingredients highlighted inline and a count such as "2 red, 3 yellow".

### Tap for the reason
Every highlighted ingredient, in the text or in the list beneath it, is tappable (and keyboard accessible). A panel explains why it was flagged, what its color means, and whether it's red because of one of your settings.

### What gets flagged

**Red (do not eat): mammal-derived ingredients**
Beef, pork, lamb, mutton, veal, venison, bison, goat, rabbit, horse, ham, bacon, sausage, jerky, organ meats, lard, tallow, suet, bone broth, bone marrow, natural/hog/sheep casings, and equivalent words in French, Spanish, German, and Italian.

**Yellow (avoid): mammal by-products and ingredients that may be processed with mammal products**

| Group | Examples |
|---|---|
| Gelatin | gelatin, E441 |
| Tissue and bone | collagen, chondroitin, cartilage, bone phosphate (E542), bone char, glucosamine |
| Unnamed animal sources | "animal fat", "animal protein", hydrolyzed protein, shortening, bouillon, E627/E631/E635 |
| Amino acids | L-cysteine |
| Enzymes and rennet | rennet, pepsin, pancreatin, lipase, trypsin, "enzymes" |
| Glycerin and glycerides | glycerin, glycerol, mono- and diglycerides, E422, E470–E479 |
| Fatty acids and stearates | stearic acid, magnesium/calcium/sodium stearate, polysorbates, oleic acid, E481–E495, E570–E572 |
| Flavors | "natural flavors" and translations |
| Lanolin | lanolin, vitamin D3 / cholecalciferol |
| Cheese and whey | cheese, whey, casein, curds (often made with animal rennet) |
| Dairy | milk, butter, cream, yogurt, ghee, lactose |

Plant-based look-alikes are **not** flagged: vegetable glycerin, plant-based mono- and diglycerides, coconut/almond/oat milk, cocoa/shea butter, cream of tartar, kidney beans, cod liver, and similar.

### Personal settings
- **Sensitivities.** Some things affect people with AGS differently. Check any of these to flag them **red** instead of yellow: dairy, gelatin, glycerin and mono/diglycerides, stearic acid and stearates, natural flavors, lanolin and vitamin D3, rennet and animal enzymes. Unchecked, they show as yellow.
- **Custom lists.** Add your own ingredients to always flag red or always flag yellow (comma separated).
- **Rating overrides.** On any result, "Rating wrong?" lets you mark a product safe or do-not-eat, or reset it. There's also a link to fix the ingredients on Open Food Facts.

### Favorites, history, and export
- **Favorites.** Add products with the star button. They show their current rating and re-rate automatically when you change settings. Tap to reopen, or remove with the **×**.
- **History.** The last 40 scanned products, with a Clear history button.
- **Export.** Export favorites as a text list using the device's share sheet, the clipboard, or a downloaded `.txt` file, whichever is available.

---

## How favorites and settings are stored

Everything personal is stored **in the visitor's own browser** using `localStorage`. There is no server, no account, and no cookies.

| Key | Contents |
|---|---|
| `gg_favs` | Favorite products (name, brand, barcode, image link, ingredient text) |
| `gg_hist` | Last 40 scanned products |
| `gg_ovr` | Your safe / do-not-eat rating overrides |
| `gg_cfg` | Sensitivities and custom flag lists |

What this means in practice:
- **Each visitor has their own data.** Two people opening the same GitHub Pages link each get a separate, private list. GitHub never sees it.
- **Per browser and device.** Favorites on a phone won't appear on a laptop, or in a different browser on the same phone.
- **Shared browsers share data.** Two people using the same browser profile would see the same list.
- **Clearing site data or using a private tab deletes it.** iPhone Safari may also remove site data after about a week of not visiting; adding the page to the Home Screen helps.
- **Why not cookies?** Cookies hold about 4 KB and are sent with every request. `localStorage` holds around 5 MB, stays on the device, and doesn't expire.

The Android app uses the same storage inside its built-in WebView, so favorites live on that phone and are separate from the web version.

---

## Privacy and data sources

- Product data comes from [Open Food Facts](https://world.openfoodfacts.org) (open database, licensed under the ODbL). The only information sent over the network is the barcode number you look up.
- On browsers without a built-in barcode detector (for example iPhone Safari), the page loads the open-source `html5-qrcode` library from cdnjs the first time you use the camera.
- No analytics, tracking, accounts, or advertising.

---

## Deploy the web version on GitHub Pages

1. Create a **public** repository.
2. Rename `galguard.html` to **`index.html`** and upload it to the repository root.
3. Go to **Settings → Pages**, set the source to **Deploy from a branch**, choose `main` and `/ (root)`, and save.
4. Open `https://YOURNAME.github.io/REPO-NAME/` on your phone. The camera requires HTTPS, which GitHub Pages provides.
5. To update, upload a new `index.html` over the old one and hard refresh (Ctrl+Shift+R, or clear site data on a phone). The footer shows the version, so you can confirm the update loaded.

Tip: use your browser's "Add to Home screen" for an app-like icon.

---

## Android app

The `GalGuardAndroid/` project wraps the same page in a native app.

- Written in Kotlin; package `com.galguard.app`; minimum Android 8.0 (API 26), target API 34.
- Serves the page from bundled assets over a secure origin, so the camera and storage work.
- **Scanning uses Google's built-in code scanner** (Google Play services). It reads barcodes and QR codes, auto-zooms, and returns as soon as a code is detected. No camera permission prompt is needed.
- If the built-in scanner can't start, the app falls back to the in-page camera and asks for camera permission.
- External links open in the phone's browser.

**Build it**
1. Install [Android Studio](https://developer.android.com/studio) and open the `GalGuardAndroid` folder (the one containing `settings.gradle.kts`).
2. Let Gradle sync.
3. Run on a connected phone with USB debugging, or use **Build → Build APK(s)** (called **Generate APKs** in newer versions) and install `app-debug.apk`.

The web page lives in `app/src/main/assets/galguard.html`. It's the same file as the web version, so updates to one can be copied to the other.

---

## Project structure

```
index.html                  The entire web app (HTML, CSS, JavaScript)
GalGuardAndroid/
  app/src/main/
    AndroidManifest.xml
    assets/galguard.html    Copy of the web app
    java/com/galguard/app/MainActivity.kt
    res/                    App icon resources
  build.gradle.kts, settings.gradle.kts, gradle/wrapper/
```

## Known limitations
- Ingredient data depends on Open Food Facts; products missing from it need a pasted ingredient list.
- Hidden sources can't be detected from a label (for example sugar refined with bone char, or an unnamed "natural flavor"). GalGuard flags the ingredient names it can see.
- Camera range depends on the phone's camera. Browsers without a built-in barcode detector use a library fallback that scans the whole frame and can't prefer the center code.
- Favorites and settings don't sync between devices.
- The Android project has not been published to the Play Store; it builds as a debug APK.

## Credits
Product data: Open Food Facts contributors. QR/barcode fallback scanning: html5-qrcode. Android scanning: Google ML Kit code scanner.
