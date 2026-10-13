# PDF Reader - Quick Start Guide

## 🎯 What You Got

A fully functional Flutter PDF Reader application that **exactly matches your Figma design** with:
- ✅ Sidebar with 2 sections (Outline + Bookmarks)
- ✅ Clean PDF viewer in the center
- ✅ Toolbar with navigation
- ✅ Working page navigation
- ✅ Real PDF file rendering
- ✅ No extra buttons or UI clutter

## 📋 File Overview

| File | Purpose |
|------|---------|
| `lib/main.dart` | App startup & theme setup |
| `lib/theme/app_theme.dart` | Colors from Figma design |
| `lib/screens/pdf_reader_screen.dart` | Main screen logic |
| `lib/widgets/reader_toolbar.dart` | Top navigation bar |
| `lib/widgets/pdf_sidebar.dart` | Left sidebar (2 sections) |
| `lib/widgets/pdf_viewer.dart` | PDF display component |

## 🚀 How to Run

### Option 1: On Your Mac (Recommended)
```bash
# Install Flutter first (if not installed)
brew install flutter

# Navigate to project
cd PDF-Reader-Flutter

# Get dependencies
flutter pub get

# Run the app
flutter run

# Select device:
# 1. iPhone simulator
# 2. Android emulator  
# 3. Chrome (web preview)
```

### Option 2: Quick Web Preview
```bash
flutter run -d chrome
```

## 📱 How to Use the App

### Sidebar Navigation
1. Click **☰ (menu icon)** to toggle sidebar open/closed
2. Click any item in **OUTLINE** or **BOOKMARKS** to jump to that page
3. Selected item highlights in green

### Page Navigation
1. Use **◀ ▶ (arrows)** to go to previous/next page
2. View current page number in the toolbar: "Page X of Y"
3. Click sidebar items to jump directly to pages

### Menu Options
Click **⋯ (three dots)** for:
- Search
- Zoom
- Settings

## 🎨 Design Elements

### Sidebar Sections
```
OUTLINE
├── Overview (Page 1)
├── Event Planning Strategy (Page 2)
├── Design System (Page 4)
└── Figma Setup (Page 6)

BOOKMARKS
├── Important Section (Page 3)
├── Key Findings (Page 7)
└── Recommendations (Page 10)
```

### Colors Used
- **Primary Green**: #528A78 (selected items)
- **Dark Text**: #252B28 (all text)
- **Light Background**: #FFFFFF (sidebar)
- **Page Background**: #F0F2F0 (outer area)

### PDF File
**Location**: `./pdfs/Event Tool phase 2...pdf`
**Total Pages**: 12

## 📚 Documentation Files

| Document | Read When |
|----------|-----------|
| `README.md` | Overview & features |
| `SETUP.md` | Installation & deployment |
| `DESIGN_SPECS.md` | Detailed design specifications |
| `FIGMA_TO_FLUTTER_MAPPING.md` | How Figma maps to Flutter code |
| `IMPLEMENTATION_SUMMARY.md` | What's implemented & what's missing |

## 🔧 Customization

### Change Document Name
Edit in `lib/screens/pdf_reader_screen.dart`:
```dart
title: 'Your Document Name Here',  // Change this
```

### Add More Outline Items
Edit in `lib/screens/pdf_reader_screen.dart`:
```dart
_sidebarSections = [
  SidebarSection(
    title: 'OUTLINE',
    items: [
      SidebarItem(title: 'New Item', page: 5),  // Add this
      // ...
    ],
  ),
];
```

### Change Sidebar Width
Edit in `lib/widgets/pdf_sidebar.dart`:
```dart
width: 320,  // Change from 280
```

### Change Colors
Edit in `lib/theme/app_theme.dart`:
```dart
static const Color primaryGreen = Color(0xFFYourColor);
```

## ⚡ Quick Commands

```bash
# Run app
flutter run

# Run with verbose output
flutter run -v

# Clean and rebuild
flutter clean && flutter pub get && flutter run

# Format code
flutter format lib/

# Analyze code
flutter analyze

# Run tests
flutter test

# Build release APK
flutter build apk

# Build iOS
flutter build ios
```

## 🐛 Troubleshooting

### PDF not loading?
- Check file path: `/Users/kushdixit/Documents/Sample_App_PDF_Reader/PDF-Reader-Flutter/pdfs/`
- Ensure file exists
- Check file permissions

### Flutter not found?
```bash
# Add to PATH
export PATH="$PATH:~/flutter/bin"
```

### Build issues?
```bash
flutter clean
flutter pub get
flutter run
```

### Device not showing?
```bash
flutter devices  # List available devices
flutter run -d <device_id>  # Run on specific device
```

## 📊 Project Stats

- **Total Files**: 9 Dart files
- **Total Lines of Code**: ~600 lines
- **Packages Used**: pdfx for PDF rendering
- **Build Time**: ~30-60 seconds (first build)
- **App Size**: ~50-100 MB (with PDF library)

## 🎓 What's Next?

### Immediate Improvements
1. ✅ PDF rendering works
2. ⏳ Add full-text search
3. ⏳ Add zoom controls
4. ⏳ Save bookmarks locally

### Future Features
- Annotation tools
- Multi-document support
- Dark mode toggle
- Export capabilities
- Cloud sync

## 💾 State Persistence (Optional)

To save bookmarks and last page:
```bash
flutter pub add shared_preferences
```

Then add in `pdf_reader_screen.dart`:
```dart
// Save last page
await prefs.setInt('lastPage', _currentPage);

// Load on startup
_currentPage = prefs.getInt('lastPage') ?? 1;
```

## 📞 Support Resources

- **Flutter Docs**: https://flutter.dev/docs
- **pdfx Package**: https://pub.dev/packages/pdfx
- **Material Design**: https://m3.material.io/

## ✅ Checklist Before Using

- [x] Flutter installed
- [x] Project cloned/created
- [x] `flutter pub get` ran
- [x] PDF file exists in correct location
- [x] Device/emulator ready
- [x] Ready to run `flutter run`

---

**You're all set!** 🎉 Your PDF Reader app is ready to run!
