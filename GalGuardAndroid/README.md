# GalGuard (Android) v3.2
1. Install Android Studio (Koala or newer). File > Open > select this folder and let Gradle sync.
2. Run on a phone with USB debugging on, or build an installable file: Build > Build APK(s). Copy app/build/outputs/apk/debug/app-debug.apk to your phone and open it.
Scanning uses Google built-in scanner; if it cannot start, the app falls back to an in-app camera view (asks for camera permission). Product data needs internet.
The app UI lives in app/src/main/assets/galguard.html, the same file as the web version.

New in 2.0: Export Settings and Import Settings buttons (export uses the Android share sheet; import uses pasted backup text), ingredients starting with "vegan" are no longer flagged, and the missing app/build.gradle.kts build file was restored.

New in 2.1: "Meatless" prefix handled like "Vegan", German ingredient lists, and a camera box that resizes to the area being checked.

New in 2.2: build workflows now publish a GitHub Release with the APK and IPA attached.

New in 2.3: menu button with themes and a Weekly Shopping List, a Recipe tab, Products/Recipes favorites, and a "Scan ingredient list" button (uses the in-app camera view; the text reader downloads on first use and needs internet).

New in 2.4: a "+ New recipe" button to add, edit and delete your own recipes (with a photo). This is the public edition, which does not include the built-in recipe collection.

New in 2.5: "Scan ingredient list" now uses Google's document scanner and on-device text recognition; Export / Import Settings moved into the menu.

New in 2.6: Add as Recipe button, device back button closes sub-screens instead of the app, graphite dark/auto themes, small layout fixes.

New in 2.7: Uncheck all button and hint on the shopping list, Seasonal themes.

New in 2.8: press-and-hold menu on shopping items (enlarged image, edit category, images for scanned products) and tap-to-enlarge product pictures.

New in 2.9: multiple shopping lists, more shopping categories (Hygiene, Pet and more), long-press highlight fix, Export favorites for recipes.

New in 3.0: updates install over older versions (fixed signing key; one last uninstall needed from older versions, export your settings first), vertical camera zoom slider, scan box starts at 70%.

New in 3.1: My Lists tab, recipe photo gallery/camera buttons, centered missing-photo picture.

New in 3.2: shopping list photos on by default, zoom slider no longer scrolls the page, scan box locked at 70%.
