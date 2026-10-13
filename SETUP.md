# PDF Reader Flutter App - Setup Guide

## Quick Start

### 1. Install Dependencies
```bash
cd PDF-Reader-Flutter
flutter pub get
```

### 2. Run the App
```bash
# For development
flutter run

# For specific device
flutter run -d <device_id>

# For release build
flutter run --release
```

### 3. Build for Production

**Android:**
```bash
flutter build apk
```

**iOS:**
```bash
flutter build ios
```

**Web:**
```bash
flutter build web
```

## File Structure Explained

```
lib/
├── main.dart                      # App initialization and theme configuration
├── theme/
│   └── app_theme.dart            # Centralized color palette and styling
├── screens/
│   └── pdf_reader_screen.dart    # Main screen with state management
└── widgets/
    ├── reader_toolbar.dart       # Top navigation bar
    └── pdf_sidebar.dart          # Sidebar with document outline
```

## Key Features Implemented

### ✅ Complete UI Structure
- Toolbar with menu and navigation
- Collapsible sidebar with outline
- PDF content area with placeholder
- Responsive layout

### ✅ Theming System
- Material 3 design principles
- Light and dark theme support
- Customizable color palette
- Consistent typography

### ✅ State Management
- Basic StatefulWidget approach
- Ready for Provider/Riverpod upgrade
- Page navigation tracking

## Integration with PDF Library

### Option 1: Using `pdfx`
```bash
flutter pub add pdfx
```

```dart
// In pdf_reader_screen.dart
import 'package:pdfx/pdfx.dart';

// Add to state:
late PdfController _pdfController;

@override
void initState() {
  super.initState();
  _pdfController = PdfController(
    document: PdfDocument.openFile('path/to/file.pdf'),
  );
}
```

### Option 2: Using `pdf_render`
```bash
flutter pub add pdf_render
```

## Customization Examples

### Change Primary Color
Edit `lib/theme/app_theme.dart`:
```dart
static const Color primaryGreen = Color(0xFFYourColor);
```

### Add Custom Fonts
1. Place fonts in `assets/fonts/`
2. Update `pubspec.yaml`
3. Use in theme

### Modify Sidebar Width
Edit `lib/widgets/pdf_sidebar.dart`:
```dart
width: 320, // Change from 280
```

## Testing the App

### Run Tests
```bash
flutter test
```

### Create a Test File
Create `test/pdf_reader_screen_test.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdf_reader/main.dart';

void main() {
  testWidgets('PDF Reader loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
```

## Performance Tips

1. **Lazy load PDF pages**: Only render visible pages
2. **Use const constructors**: Already implemented where possible
3. **Cache PDF metadata**: Store outline and page count
4. **Optimize images**: Compress PDF before loading

## Debugging

### Enable Debug Logs
```bash
flutter run -v
```

### Use Flutter DevTools
```bash
flutter pub global activate devtools
flutter devtools
```

Then in browser, select your running app for inspection.

### Common Issues

**"SDK version not supported"**
```bash
flutter upgrade
```

**"Gradle build failed"**
```bash
cd android && ./gradlew clean && cd ..
flutter pub get
flutter run
```

## Next: Add PDF Functionality

1. Add PDF library dependency
2. Implement `PdfController` or equivalent
3. Connect page navigation to PDF viewer
4. Add zoom, search, and annotation features
5. Implement bookmarks saving

## Version History

- **v1.0.0** - Initial UI implementation from Figma design

---

For more help: `flutter doctor -v` for system info
