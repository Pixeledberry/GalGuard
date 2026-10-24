plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

android {
    namespace = "com.galguard.app"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.galguard.app"
        minSdk = 26
        targetSdk = 34
        versionCode = 33
        versionName = "3.8.1"
    }

    // One fixed signing key for every build, so a new version installs over an older one and keeps its data.
    signingConfigs {
        create("galguard") {
            storeFile = file("galguard.jks")
            storePassword = "galguard"
            keyAlias = "galguard"
            keyPassword = "galguard"
        }
    }
    buildTypes {
        getByName("debug") { signingConfig = signingConfigs.getByName("galguard") }
        getByName("release") { signingConfig = signingConfigs.getByName("galguard") }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions { jvmTarget = "17" }
}

dependencies {
    implementation("androidx.webkit:webkit:1.11.0")
    implementation("androidx.core:core:1.13.1")
    implementation("com.google.android.gms:play-services-code-scanner:16.1.0")
    implementation("com.google.android.gms:play-services-mlkit-document-scanner:16.0.0")
    implementation("com.google.android.gms:play-services-mlkit-text-recognition:19.0.1")
}
