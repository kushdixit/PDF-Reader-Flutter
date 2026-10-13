# PDF Reader - Flutter App

A beautiful PDF Reader application built with Flutter, designed based on Figma mockup.

## Features

- 📄 Clean PDF Reader UI with toolbar and navigation
- 📑 Collapsible sidebar with document outline/bookmarks
- 🎨 Modern design with custom theme matching Figma design
- 📱 Responsive layout (works on mobile, tablet, and desktop)
- ⚙️ Menu with search, zoom, and settings options
- 🎯 Page navigation with current/total page indicator

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── theme/
│   └── app_theme.dart       # Color palette and theme configuration
├── screens/
│   └── pdf_reader_screen.dart # Main PDF reader screen
└── widgets/
    ├── reader_toolbar.dart    # Top toolbar with navigation
    └── pdf_sidebar.dart       # Collapsible sidebar with outline
```

## Getting Started

### Prerequisites

- Flutter SDK 3.0+
- Dart 3.0+

### Installation

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Run the app:
   ```bash
   flutter run
   ```

### For PDF Viewing (Optional)

To add actual PDF rendering, uncomment the PDF dependencies in `pubspec.yaml`:

```yaml
dependencies:
  # Choose one of these PDF viewing libraries:
  pdfx: ^2.5.0
  # OR
  pdf_render: ^3.1.0
```

Then implement PDF viewing in the `_buildPDFContent()` method.

## Design Details

### Color Palette

- **Primary Green**: `#528A78` - Main brand color
- **Light Green BG**: `#E8EFEB` - Button backgrounds
- **Dark Text**: `#252B28` - Primary text color
- **Light BG**: `#F0F2F0` - Page background
- **White**: `#FFFFFF` - Component backgrounds
- **Border Gray**: `#E5E5E5` - Dividers and borders

### Components

#### ReaderToolbar
- Sidebar toggle button
- Document title display
- Current/total page indicator
- Navigation controls (prev/next)
- Menu button

#### PDFSidebar
- Document outline/bookmarks
- Hierarchical structure support
- Selection highlighting
- Smooth animation

## Token Usage

**Estimated tokens used**: ~15,000-25,000
- Design analysis: ~3,000
- Code generation: ~12,000-20,000
- Documentation: ~2,000

## Next Steps

1. **Add PDF Library**: Integrate `pdfx` or `pdf_render` for actual PDF rendering
2. **Implement Navigation**: Connect page navigation controls to PDF viewer
3. **Add Search**: Implement full-text search functionality
4. **Add Zoom**: Implement zoom controls and pinch-to-zoom
5. **State Management**: Consider adding Provider/Riverpod for complex state handling
6. **Persistence**: Add functionality to save bookmarks and last page viewed

## Customization

### Changing Colors

Edit `lib/theme/app_theme.dart`:

```dart
static const Color primaryGreen = Color(0xFF528A78); // Change this
```

### Adding Custom Fonts

1. Add font files to `assets/fonts/`
2. Update `pubspec.yaml`:
   ```yaml
   fonts:
     - family: YourFont
       fonts:
         - asset: assets/fonts/YourFont-Regular.ttf
   ```
3. Use in theme or directly in widgets

## Troubleshooting

- **Flutter not found**: Ensure Flutter is in your PATH
- **Dependencies error**: Run `flutter pub get` to reinstall
- **Hot reload issues**: Try `flutter clean` then `flutter pub get`

## License

This project is open source and available under the MIT License.

## Support

For issues or questions about this Flutter implementation, refer to the original Figma design or create an issue in the repository.
