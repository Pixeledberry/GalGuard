🚫🍖 I want to be 100% transparent and let everyone know that this project is 100% vibe-coded. I'm just a man with an idea. I barely know how to code. AI did all of the heavy lifting here. 🍖🚫

This app has an HTML web version, an Android, and an Apple version. $\color{red}{\text{(Apple version needs a sideloading tool to install because the app is not signed. If unable, just use the web app)}}$ I do not own an apple device so if there's issues then I apologize, but you'll just have to use the web app.

Here's the public HTML for the app. https://pixeledberry.github.io/TickedOff/ Either just leave the page open in your browser or you can install the web version of the app by:

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

# TickedOff

A barcode scanner that checks food ingredients against **your allergies and conditions**: alpha-gal syndrome (AGS), celiac disease and common food allergies. Scan a product, and TickedOff shows its ingredient list with problem ingredients highlighted in red or yellow, plus a one-glance rating.

It runs as a single static web page (`index.html`, no build step, no backend) and also ships as an Android wrapper app.

> **Disclaimer:** TickedOff is a screening aid, not medical advice. Ingredient data is crowdsourced and can be missing or wrong, and some ingredients (such as "natural flavors") never reveal their source. Always read the label and follow your allergist's guidance.

---

## Changelog

### v3.8.3 (latest)
- **Clearer messages when a product can’t be looked up.** Instead of always blaming your connection, TickedOff now tells you whether you’re offline, whether the product databases aren’t responding (usually a problem on their side, so try again later), or whether the product simply isn’t listed. If only some databases don’t answer, it names them, because the product might be listed there.
- **Placeholder for missing product photos.** If a product photo has moved or been deleted on the database site, favorites, history, results and the shopping list show a 📦 placeholder instead of a broken image.
- **Updates survive a repo rename.** The Android updater now accepts new versions from any repository on the Pixeledberry GitHub account, so renaming the repo won’t stop updates. It still refuses downloads from anywhere else.

### v3.8.2
- **"Don’t remind me" for updates.** The update notice now has a **Don’t remind me** button next to **Not now**. It turns off automatic update reminders for good. **Menu → Check for updates** still checks when you tap it, and the notice it shows has a button to turn reminders back on.
- **In-app changelog.** **Menu → Show Changelog** (under Check for updates) opens a window with the last 5 updates and a link to GitHub for older ones. Close it with the × button, by tapping outside the window, or with your phone’s back button. Scrolling inside it only scrolls the window.

### v3.8.1
- **The ingredient box scrolls instead of stretching.** The box where you paste or type an ingredient list can no longer be resized by dragging. It grows with the text up to a set height, then scrolls on its own. Scrolling inside it moves only the box, not the rest of the app.
- **New "Always ignore" box** in "My settings", under "Always flag yellow / avoid". Add your own ingredients (comma separated) and they are never flagged; they show in grey as ignored, the same way an ignored sensitivity does. Your "Always flag red" list still wins if an ingredient is in both. It only affects the alpha-gal flags: anything set in **My allergies** is still flagged. The list is included in Export/Import Settings, and older backups still import.

### v3.8
- **Update notices.** TickedOff now tells you when a new version is out.
  - **Web:** a banner says "A new version of TickedOff is available" with a **Reload** button.
  - **Android (public version):** tap **Update** and the app downloads the new version and opens Android's installer. You only tap **Install**, and your favorites and settings are kept. The first time, Android asks you to allow TickedOff to install apps; the notice walks you through it.
  - **Android (private version) and Apple:** a notice with a **Get it** link to the new release. Apple users install it with their sideloading tool.
- **Not now** hides the notice for 3 days. If an even newer version comes out, it shows again right away. The notice never blocks the app.
- **Menu → Check for updates** checks right away and shows which version you have.
- The apps check at most every 12 hours and only after the new download is ready. Updates are checked starting from this version, so v3.7 and older still need one manual update to get here.

### v3.7
- **Four product databases instead of one.** A scanned barcode is now looked up in **Open Food Facts**, **Open Beauty Facts** (soap, shampoo, lotion, toothpaste, deodorant and other personal care), **Open Products Facts** (cleaners and other everyday non-food products) and **Open Pet Food Facts** at the same time, and the first match is used. Results from the sister databases are checked exactly like food: same highlights, ratings, allergy checks, favorites, history, shopping list and backups.
- **"From Open Beauty Facts" label** on results that did not come from the food database, and the "Fix the ingredients" link now opens the right database.
- **A few cosmetic ingredients added** to the mammal-derived list (keratin, elastin, placenta). Sodium tallowate, lanolin, glycerin, stearates and collagen were already flagged.
- Non-food entries often have missing or incomplete ingredient lists, so you will see more "Can’t tell" results. Paste the ingredient list from the pack if that happens.

### v3.6.1
- **New sensitivity: carrageenan.** Carrageenan (a seaweed thickener, also written E407) is now in the sensitivities list under "My settings" with the usual **Ignore | Avoid | Don’t eat** choice. It is on by default as **Avoid** (yellow) because some people with AGS report reacting to it, and it is not a mammal product. German, French and Spanish spellings are matched too. Set it to Ignore if it doesn’t bother you.

### v3.6
- **Now for allergies too, not just alpha-gal.** A new **My allergies** section (under Scan) lets you tap what you need to avoid: milk, egg, peanut, tree nuts, soy, wheat, **gluten (celiac)**, fish, shellfish and sesame, plus a box for anything else. Alpha-gal is one choice among equals, and you can turn alpha-gal checking off if it doesn’t apply to you.
- **First-run question.** New installs are asked "What do you need to avoid?" with alpha-gal and every allergy as equal choices (or Skip). Existing users are not asked, and nothing changes for them until they add an allergy.
- **Two-line results.** When you have allergies set, each result shows **Alpha-gal** and **Your allergies** separately, and the overall verdict is Do not eat if either one is bad. Allergy matches are highlighted **purple** so they can’t be confused with the red/yellow alpha-gal flags.
- **Hidden names and other languages.** Each allergy also matches its derivatives (for example casein and whey for milk, albumin for egg, tahini for sesame) plus common German, French and Spanish words. Plant milks, "peanut butter" vs "cocoa butter", flours like rice flour and "free from" claims are handled so they don’t cause false alarms.
- **"May contain" and Open Food Facts allergen data.** Warnings like "may contain traces of…" show as a softer purple and lower the rating to Avoid, and the allergens and traces recorded by Open Food Facts are used too. A "gluten-free" or other "free from" claim never overrides the ingredient check.
- **Per-allergy severity.** Choose **Avoid completely** (Do not eat) or **Just flag it** (Avoid) for each allergy. Celiac detail: wheat, barley, rye, malt and brewer’s yeast are flagged, and oats are flagged as "may contain" because of cross-contamination.
- **Everywhere else.** Recipe cards show your allergy match, adding a conflicting item or recipe to the shopping list gives a heads-up, and Favorites, History and recipes re-rate automatically. Your allergy choices are included in Export/Import Settings, and older backups still import.
- **More general wording** across the app, and the Recipes tab now refreshes right after you change your settings.

### v3.5.1
- **Sensitivity buttons renamed.** The three choices for each sensitivity are now **Ignore | Avoid | Don’t eat**. "Avoid" (yellow) is the old "Caution" and is still the default, and "Don’t eat" (red) is the old "Avoid". The explanation panel buttons, messages and help text use the same names.
- **Hint text in the "always flag" boxes now fits.** The grey hint text in the two boxes under "My settings" (and in the product name box) shrinks automatically to fit the width of your screen, so it is no longer cut off.
- **Wording:** the red box now says "Always flag red / don’t eat (comma separated)".

### v3.5
- **Turn off a sensitivity you don't react to.** Each sensitivity in "My settings" (dairy, gelatin, glycerin, stearates, natural flavors, carrageenan, lanolin, rennet) now has three choices: **Ignore** (not flagged), **Avoid** (yellow, the default) and **Don’t eat** (red). Your old settings convert automatically: anything you had checked is now Avoid, and the rest stay Caution.
- **"Not a problem for me" shortcut.** Tap a flagged ingredient in a result and its explanation panel has a **Not a problem for me** button (it also offers **Flag red (Avoid)** or **Back to Caution**). A message confirms the change and has an **Undo** button.
- **Ignored ingredients stay visible.** They are shown in grey with a dotted underline, tapping one says it is ignored and lets you change it back, and a result with nothing else flagged says how many were ignored ("1 ignored by your settings"), so a "Likely OK" can't be mistaken for a clean label. Reactions can change, so the app reminds you to check with your allergist. Core triggers (mammal meat and similar) can't be turned off. History, Favorites and recipe ratings update automatically, and Export and Import Settings carry the new choices.
- **New "Default" theme.** It is the dark theme with the app icon's mint color for the main buttons and highlights, it is now the starting theme for new installs, and it sits under "Auto (device)" in the Basic themes (Dark moved to its right). If you already picked a theme, it is kept.

### v3.4.1
- **Android icon fixed.** The shield on the Android home-screen icon was too big, because Android crops and masks app icons. It is now smaller, so it looks the same as the icon on the web app (a shield with space around it) with round, square or rounded-square icon shapes.

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

**Languages.** Ingredient lists in English, French, Spanish, Italian, and German are checked. German has the fullest coverage. If a product has no English list, TickedOff reads its original-language or German list.

### Personal settings
- **My allergies.** Pick the allergies you need to avoid (milk, egg, peanut, tree nuts, soy, wheat, gluten/celiac, fish, shellfish, sesame, or your own). Each can be set to **Avoid completely** or **Just flag it**, and alpha-gal checking can be switched off. Results show purple allergy highlights and separate Alpha-gal and Your allergies lines.
- **Sensitivities.** Some things affect people with AGS differently. For each of these choose **Ignore** (not flagged), **Avoid** (yellow, the default) or **Don’t eat** (red): dairy, gelatin, glycerin and mono/diglycerides, stearic acid and stearates, natural flavors, lanolin and vitamin D3, rennet and animal enzymes.
- **Custom lists.** Add your own ingredients to always flag red, always flag yellow, or always ignore (comma separated). The ignore list never hides an allergy you set in My allergies.
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

### Updates
- **Web version:** when a newer version is published, a banner offers a **Reload**.
- **Android and Apple apps:** they check GitHub for a newer release (at most every 12 hours, or any time from **Menu → Check for updates**). On Android (public version), **Update** downloads the new version and opens the installer for you. On Apple, and in the private Android version, the notice links to the release so you can install it.
- **Not now** hides the notice for 3 days. Nothing is ever blocked.
- **Don’t remind me** turns update reminders off. **Menu → Check for updates** still works, and lets you turn reminders back on.
- **Menu → Show Changelog** shows what changed in the last 5 updates.

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
tickedoff-icon.svg          Source artwork for the icon
.github/workflows/         build-android.yml and build-ios.yml (optional cloud builds)
TickedOffiOS/
  project.yml               XcodeGen project definition
  TickedOff/                Swift source, bundled page, and app icon
TickedOffAndroid/
  app/src/main/
    AndroidManifest.xml
    assets/tickedoff.html   Copy of the web app
    java/com/galguard/app/MainActivity.kt
    res/                    App icon resources (dark shield with a tick)
  store-icon-512.png        512 px icon for store listings
  build.gradle.kts, settings.gradle.kts, gradle/wrapper/
```

## Known limitations
- Recipes you add are stored in your browser or app on that device only (about 5 MB total, shared with other saved data). Large photos are shrunk automatically.
- The ingredient-list scanner needs internet the first time to download the text reader, and has not been tested on a real phone camera in every lighting or packaging situation. Always check the pasted text.
- Chicken, turkey and poultry sausage and bacon are shown yellow (avoid), not red, because of possible pork or beef casings; check the label.
- The German word "Rind" on its own (beef) is not flagged, because the same word means rind or peel in English ("orange rind"). Words like "Rindfleisch", "Rindertalg", and "vom Rind" are flagged.
- Ingredient data depends on Open Food Facts; products missing from it need a pasted ingredient list.
- Hidden sources can't be detected from a label (for example sugar refined with bone char, or an unnamed "natural flavor"). TickedOff flags the ingredient names it can see.
- Camera range depends on the phone's camera. Browsers without a built-in barcode detector use a library fallback that scans the whole frame and can't prefer the center code.
- On iPhone and iPad, the web page uses the library fallback scanner, which scans the whole frame and doesn't pick the code nearest the center or offer a zoom slider. The iOS app uses Apple's scanner instead.
- Favorites and settings don't sync automatically between devices; use Export Settings and Import Settings to move them.
- The Android project has not been published to the Play Store; it builds as a debug APK.

## Credits
Product data: Open Food Facts contributors. Ingredient text recognition: Tesseract.js. QR/barcode fallback scanning: html5-qrcode. Android scanning: Google ML Kit code scanner.
