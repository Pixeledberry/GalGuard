🚫🍖 I want to be 100% transparent and let everyone know that this project is 100% vibe-coded. I'm just a man with an idea. I barely know how to code. AI did all of the heavy lifting here. 🍖🚫

This app has an HTML web version, an Android, and an Apple version. $\color{red}{\text{(Apple version needs a sideloading tool to install because the app is not signed. If unable, just use the web app)}}$ I do not own an apple device so if there's issues then I apologize, but you'll just have to use the web app.

Here's the public HTML for the app. https://pixeledberry.github.io/GalGuard/ Either just leave the page open in your browser or you can install the web version of the app by:

Go to the app webpage then:

**On iPhone or iPad (Safari)**

1. Tap the Share button (the square with an upward arrow).
2. Scroll down and tap Add to Home Screen (if you do not see it, scroll to the bottom, tap Edit Actions, and add it).
3. Rename the app if desired, turn on Open as Web App, and tap Add.

**On Android (Google Chrome, Firefox, Brave)**

1. Tap the More menu (three dots) on the right side of the address bar.
2. Select Install and create shortcut or Add to Home screen, then tap Install

$\color{red}{\text{Otherwise if you want a standalone app instead of the web version, you can install}}$

$\color{red}{\text{the android or apple version of the app from the available releases. You really SHOULD be using}}$

$\color{red}{\text{the standalone apps. They use the Google and Apple scanners respectively and perform much better.}}$

---

# GalGuard

A barcode scanner that checks food ingredients for people with **alpha-gal syndrome (AGS)**. Scan a product, and GalGuard shows its ingredient list with problem ingredients highlighted in red or yellow, plus a one-glance rating.

It runs as a single static web page (`index.html`, no build step, no backend) and also ships as an Android wrapper app.

> **Disclaimer:** GalGuard is a screening aid, not medical advice. Ingredient data is crowdsourced and can be missing or wrong, and some ingredients (such as "natural flavors") never reveal their source. Always read the label and follow your allergist's guidance.

---

## Changelog

### v3.3 (latest)
- **Clear history button restyled.** It now uses the same color as the other main buttons (white in dark mode) and in every theme.
- **"Are you sure?" before clearing history.** Pressing "Clear history" now asks "Clear your whole history?" with **Yes, clear history** and **Cancel**.
- **Themes: HIGH CONTRAST and LOW CONTRAST.** The "Masculine" and "Feminine" groups are renamed. **HIGH CONTRAST** keeps the five dark-and-bold colors (Midnight Navy, Steel Blue, Forest, Graphite Amber, Deep Ocean) but they now use pure white or black text, brighter accents and stronger borders. **LOW CONTRAST** keeps the five rose/lavender/peach/orchid/berry colors as soft pastels (Rose Quartz, Lavender Mist, Peach Blush, Orchid Haze, Berry Sorbet). The two former dark ones, Orchid Night and Berry Dusk, are now light pastels. If you had one of these themes selected, it stays selected.

### v3.2
- **Product photos in shopping lists are on by default.** Scanned products show their small photo in every shopping list. You can still turn them off from the press-and-hold menu of a scanned item, and your choice is remembered. (If you had photos off before, this version turns them on once.)
- **Camera zoom slider no longer scrolls the page.** Moving the slider on a phone now only changes the zoom.
- **Scan box locked at 70%.** The barcode scan box stays at 70% and no longer shrinks. If nothing is found for a few tries, the automatic zoom still steps in, unless you are using the zoom slider.

### v3.1
- **My Lists tab.** The "Favorites" tab is now **My Lists**, and the red number bubble on it is gone. It shows all of your lists: **Products** and **Recipes** (your favorites, each with its count in brackets, like Recipes) and every shopping list, including ones you create with **+ New list**. Tap a list to open it; the others are hidden until you go back. Press and hold a list for **Merge lists**, **Rename**, **Clear list** and **Delete list**. Products and Recipes are built-in, so they can only be cleared. The Weekly Shopping List is still in the menu too.
- **Recipe photos work on Android.** "Choose photo" now opens your phone's gallery, and there is a new **Take photo** button, to the left of it, that opens the camera.
- **Missing-photo picture centered.** The placeholder plate shown when a recipe has no photo is now centered in the photo frame.
- **Analyze, Try a sample and Add as recipe** are now on one line (the button now reads "Add as recipe").
- **Release notes:** the Android install note now mentions tapping **More info**, then **Install anyway**, if Android blocks the install.

### v3.0
- **Updating the Android app now works.** Before this version, each build was signed with a different random key, so Android refused to install a new version over an older one and you had to uninstall first. From this version on, every build uses the same fixed key, so future updates install over the old one and keep your settings, favorites, history and shopping lists. **One last time:** if you have a version older than 3.0, Android will still ask you to uninstall it, which erases its data. Before you do that, open the menu, choose **Export / Import Settings** and copy or save your backup, then import it into 3.0. After that, updates are automatic. (On iPhone, a sideloading tool such as AltStore or Sideloadly keeps your data when it re-installs over the older version, as long as you use the same Apple ID.)
- **Zoom slider on the camera.** The barcode camera view has a vertical zoom slider on the right side. Moving it takes over from the automatic zooming for that scan. Phones whose camera does not allow zoom control use a digital zoom, so the slider works everywhere.
- **Scan box starts at 70%.** The scan box now starts at 70% of the view and shrinks from there. The 100% size is gone.

### v2.9
- **Multiple shopping lists.** The Weekly Shopping List now has a list picker and a **+ New list** button (up to 20 lists, for example "Costco" or "Pharmacy"). You can rename or delete a list, and each list has its own week and items. Press and hold an item and choose **Move to another list** to move it. Items you add from a recipe or a scanned product go to the list that is currently open, and the message tells you which one. Your existing list is kept as "Shopping list". Export Settings and Import Settings carry all of your lists; imported lists with the same name are merged.
- **More shopping categories.** Items can now be sorted into Produce, Meat & seafood, Deli, Dairy & eggs, Bakery, Frozen, Pantry & canned, Spices & baking, Condiments & sauces, Breakfast & cereal, Snacks, Beverages, **Hygiene**, Health & pharmacy, Baby, Household & cleaning, Paper goods, **Pet** and Other. New items are sorted automatically, and you can change any item with "Edit category". (The old "Pantry & other" is now "Other".)
- **Long-press highlight fixed.** Pressing and holding a shopping list item no longer leaves its text highlighted.
- **Export favorites for recipes.** Favorites → Recipes and the "★ Favorites" view in the Recipes tab now have an **Export favorites** button, the same as for products. It lists each recipe with its rating (and the link, or the ingredients for recipes you created).

### v2.8
- **Press and hold a shopping list item** to open a menu with **View Enlarged Image** and **Edit category** (move the item to another aisle, or go back to Automatic). For scanned products the menu also has an option to **turn images on or off for all scanned products**; when on, each scanned product shows a small version of its picture in the list.
- **Tap any scanned product's picture to enlarge it**: on the result page, in Favorites and History, and in the shopping list. The back button, Esc or a tap closes it.
- **README:** the public README now tells people to use the standalone apps (shown in red).

### v2.7
- **Shopping list buttons.** "Clear checked" is now **Uncheck all**: it keeps every item and just clears the check marks. "Start new week" and "Copy or share list" swapped places ("Start new week" is now in the top row). A hint at the bottom of the page explains what "Start new week" does.
- **Seasonal themes.** A new "Seasonal" group under the Feminine themes in the menu: Spring Meadow, Summer Sunshine, Autumn Harvest, Winter Frost, Halloween and Holiday.

### v2.6
- **Add as Recipe.** A new button next to "Try a sample" in "Paste an ingredient list" turns the pasted or scanned list into a new recipe: it opens the New recipe page with the ingredients already filled in, one ingredient per line (split at the commas, keeping anything in brackets together). Add a name, photo and steps, then save.
- **Device back button.** Pressing back on your phone (or the browser's back button) now leaves a sub-screen instead of closing the app: it closes the menu, the Shopping List, the Export / Import page, a recipe, and the recipe editor, one step at a time. On iPhone you can swipe in from the left edge.
- **Graphite look.** The Dark theme and the Auto theme (in both light and dark mode) now use graphite grey instead of blue-black. The colored dark presets (Midnight Navy, Forest, Deep Ocean, Orchid Night, Berry Dusk) keep their own colors.
- **Smaller fixes.** The footer now reads "v2.6" (the word "Web" is gone); the main tab is named "Recipes"; the barcode box hint is smaller so it is no longer cut off; the recipe ingredient box label now reads: Ingredients (one per line; end a line with enter key. ":" to start a group, like "Sauce:").

### v2.5
- **Better ingredient-list scanner in the apps.** On Android, "Scan ingredient list" now opens Google's document scanner (it finds the label, crops it and lets you retake or choose a photo) and reads it with Google's on-device text recognition. On iPhone and iPad it uses Apple's document camera and Apple's on-device text recognition. Both are more accurate than the web reader and work offline. If the built-in scanner can't start, the app falls back to the camera view. The web page still uses the camera reader (Tesseract.js), which needs internet the first time.
- **Reads everything after "Ingredients".** The list now starts at the word "Ingredients" and includes everything after it, including the "Contains:" allergen line and anything printed below. If the word "Ingredients" can't be found, the full text is pasted so you can trim it.
- **Export / Import Settings moved into the menu.** A single "Export / Import Settings" button at the bottom of the hamburger menu (below "Reset to automatic") opens a page with the Export Settings and Import Settings buttons.

### v2.4
- **Your own recipes.** The Recipe tab has a **+ New recipe** button: name, category, prep/cook/total time, servings, a photo, ingredients (end a line with ":" for a group heading), instructions and notes. Your recipes get the same red/yellow ingredient checking, can be favorited, added to the shopping list, shared, edited and deleted. They are saved on the device and included in Export Settings and Import Settings.

---

## Features

Works in modern browsers on iPhone and iPad (Safari), Android, and desktop. On iPhone and iPad the camera uses a built-in scanning library.

### Looking up products
- **Live camera scanning.** Point the camera at a barcode and it searches automatically as soon as a code is read.
- **QR codes.** QR codes that contain a product number (including GS1 Digital Link URLs) are looked up automatically. Other QR codes show a short notice and scanning continues.
- **Supported formats:** EAN-13, EAN-8, UPC-A, UPC-E, Code 128, Code 39, QR.
- **Built for distance and small codes.**
  - Requests high-resolution video with continuous autofocus.
  - The scan box on the camera view starts at its largest size. If nothing is found, it re-checks a smaller, magnified area and the box shrinks on screen to match, then returns to full size and starts again.
  - Shows a zoom slider on phones that support camera zoom, and steps the zoom up each time a full round finds nothing.
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
Beef, pork, lamb, mutton, veal, venison, bison, goat, rabbit, horse, ham, bacon, sausage, jerky, organ meats, lard, tallow, suet, bone broth, bone marrow, natural/hog/sheep casings, and equivalent words in French, Spanish, Italian, and German (including German compound words such as Schweinefleisch, Rindertalg, and Schweineschmalz).

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
| Cheese and whey | cheese (parmesan, feta, mozzarella, cheddar and many more), whey, casein, curds (often made with animal rennet) |
| Poultry sausage and bacon | chicken, turkey or poultry sausage, bacon, hot dogs, ham (casings and processing can involve pork or beef) |
| Dairy | milk, butter, cream, half-and-half, yogurt, ghee, lactose |

Plant-based look-alikes are **not** flagged (including anything labeled dairy-free, non-dairy or plant-based milk, butter or cheese): vegetable glycerin, plant-based mono- and diglycerides, coconut/almond/oat milk, cocoa/shea butter, cream of tartar, kidney beans, cod liver, and similar. Any ingredient that starts with the word "vegan" or "meatless" (for example "Vegan Pepperoni" or "Meatless Pepperoni") is skipped as well, along with the German "vegane", "fleischlose", "pflanzliches", and "mikrobielles".

**Languages.** Ingredient lists in English, French, Spanish, Italian, and German are checked. German has the fullest coverage. If a product has no English list, GalGuard reads its original-language or German list.

### Personal settings
- **Sensitivities.** Some things affect people with AGS differently. Check any of these to flag them **red** instead of yellow: dairy, gelatin, glycerin and mono/diglycerides, stearic acid and stearates, natural flavors, lanolin and vitamin D3, rennet and animal enzymes. Unchecked, they show as yellow.
- **Custom lists.** Add your own ingredients to always flag red or always flag yellow (comma separated).
- **Rating overrides.** On any result, "Rating wrong?" lets you mark a product safe or do-not-eat, or reset it. There's also a link to fix the ingredients on Open Food Facts.
- **Export Settings / Import Settings.** A button at the bottom of the menu (top right) opens a page with two buttons that create a backup of your settings, favorites, history, rating overrides, theme, favorite and created recipes and shopping list (a small text file) and restore it on another device. You can save or share the backup, copy it, and import it from a file or by pasting the text.

### Recipes
- **Add your own recipes** with the **+ New recipe** button: name, category, prep, cook and total time, servings, a photo (shown at the top of the recipe), ingredients, instructions and notes. Edit or delete them any time.
- **Search and filters.** Search by recipe name or ingredient; filter by category or by safety rating (hide "Do not eat" or show only "Likely OK").
- **Same ingredient checking as products.** Every ingredient is checked with your sensitivities and custom lists, highlighted red or yellow, and tappable for the reason. Each recipe card shows its rating.
- **Add as Recipe.** In "Paste an ingredient list", the "Add as Recipe" button sends the list to a new recipe, one ingredient per line.
- **Favorite recipes** are listed under "★ Favorites" in the Recipes tab and under My Lists → Recipes.
- Recipes and photos are saved on your device only. Use Export Settings to back them up.

### Weekly shopping list
- Open it from the menu (top right). Add items by hand, with the "+" next to a recipe ingredient, "Add all to list" on a recipe, or "Add to shopping list" on a scanned product.
- Keep several lists (for example Costco or Pharmacy). Items are grouped by category (produce, meat and seafood, deli, dairy and eggs, bakery, frozen, pantry, spices and baking, condiments, breakfast, snacks, beverages, hygiene, health, baby, household, paper goods, pet, other), can be checked off or removed, and the list can be copied or shared. Press and hold an item to enlarge its image, change its category, or show small pictures for scanned products.
- Each list is tied to a week (Monday start). "Start new week" removes checked items and keeps the rest. Duplicates are ignored.

### Menu and themes
- The hamburger button at the top right opens the menu. Pick a preset (Auto, Light, Dark, five high contrast, five low contrast pastel) or choose your own background and accent colors. Red and yellow highlight colors stay readable in every theme.

### Scan an ingredient list
- In the Android and iPhone apps, "Scan ingredient list" uses Google's document scanner (Android) or Apple's document camera (iPhone), with on-device text recognition. On the web it uses the camera view below. It reads the printed ingredient list, fills the "Paste an ingredient list" box and analyzes it. The box starts large and shrinks while it looks, like the barcode scanner. "Capture now" uses whatever is in view.
- Where the camera can't be used, "Photo of ingredient list" reads a photo instead. The reading language is chosen under My settings. Everything after the word "Ingredients" is included.
- The text reader (Tesseract.js) is downloaded the first time and needs internet. Printed text on curved or shiny packaging can be misread, so check the pasted text.

### My Lists, history, and export
- **My Lists.** The My Lists tab shows **Products** and **Recipes** (your favorites, with counts) and all of your shopping lists. Tap one to open it, and press and hold for Merge lists, Rename, Clear list or Delete list. Add products with the star button. They show their current rating and re-rate automatically when you change settings. Tap to reopen, or remove with the **×**.
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
| `gg_cfg` | Sensitivities, custom flag lists and ingredient-scan language |
| `gg_rfavs` | Favorite recipe ids |
| `gg_myrec` | Recipes you created |
| `gg_shops` | Shopping lists |
| `gg_theme` | Selected theme or custom colors |

**Moving to a new device:** open the menu and tap **Export / Import Settings**, then **Export Settings**, on the old device to create a backup, then **Import Settings** on the new one. Importing adds the backup's favorites and history to anything already there and replaces the sensitivity settings.

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

## Project structure

```
index.html                  The entire web app (HTML, CSS, JavaScript)
manifest.webmanifest        Optional: lets "Add to Home screen" install it as an app
apple-touch-icon.png        Optional: home screen icon on iPhone and iPad
icon-192.png, icon-512.png  Optional: app icons for the manifest
galguard-icon.svg           Source artwork for the icon
.github/workflows/         build-android.yml and build-ios.yml (optional cloud builds)
GalGuardiOS/
  project.yml               XcodeGen project definition
  GalGuard/                 Swift source, bundled page, and app icon
GalGuardAndroid/
  app/src/main/
    AndroidManifest.xml
    assets/galguard.html    Copy of the web app
    java/com/galguard/app/MainActivity.kt
    res/                    App icon resources (shield and silver G)
  store-icon-512.png        512 px icon for store listings
  build.gradle.kts, settings.gradle.kts, gradle/wrapper/
```

## Known limitations
- Recipes you add are stored in your browser or app on that device only (about 5 MB total, shared with other saved data). Large photos are shrunk automatically.
- The ingredient-list scanner needs internet the first time to download the text reader, and has not been tested on a real phone camera in every lighting or packaging situation. Always check the pasted text.
- Chicken, turkey and poultry sausage and bacon are shown yellow (avoid), not red, because of possible pork or beef casings; check the label.
- The German word "Rind" on its own (beef) is not flagged, because the same word means rind or peel in English ("orange rind"). Words like "Rindfleisch", "Rindertalg", and "vom Rind" are flagged.
- Ingredient data depends on Open Food Facts; products missing from it need a pasted ingredient list.
- Hidden sources can't be detected from a label (for example sugar refined with bone char, or an unnamed "natural flavor"). GalGuard flags the ingredient names it can see.
- Camera range depends on the phone's camera. Browsers without a built-in barcode detector use a library fallback that scans the whole frame and can't prefer the center code.
- On iPhone and iPad, the web page uses the library fallback scanner, which scans the whole frame and doesn't pick the code nearest the center or offer a zoom slider. The iOS app uses Apple's scanner instead.
- Favorites and settings don't sync automatically between devices; use Export Settings and Import Settings to move them.
- The Android project has not been published to the Play Store; it builds as a debug APK.

## Credits
Product data: Open Food Facts contributors. Ingredient text recognition: Tesseract.js. QR/barcode fallback scanning: html5-qrcode. Android scanning: Google ML Kit code scanner.
