import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../theme/app_theme.dart';
import '../widgets/reader_toolbar.dart';
import '../widgets/pdf_sidebar.dart';
import '../widgets/pdf_viewer.dart';

class PDFReaderScreen extends StatefulWidget {
  const PDFReaderScreen({super.key});

  @override
  State<PDFReaderScreen> createState() => _PDFReaderScreenState();
}

class _PDFReaderScreenState extends State<PDFReaderScreen> {
  // Bundled as a Flutter asset (see pubspec.yaml), so it works on web.
  static const _pdfAssetPath = 'pdfs/sample_pdf.pdf';

  // Sample sidebar sections - exactly 2 sections as per design
  static const _sidebarSections = [
    SidebarSection(
      title: 'OUTLINE',
      items: [
        SidebarItem(title: 'Overview', page: 1),
        SidebarItem(title: 'Event Planning Strategy', page: 2),
        SidebarItem(title: 'Design System', page: 4),
        SidebarItem(title: 'Figma Setup', page: 6),
      ],
    ),
    SidebarSection(
      title: 'BOOKMARKS',
      items: [
        SidebarItem(title: 'Important Section', page: 3),
        SidebarItem(title: 'Key Findings', page: 7),
        SidebarItem(title: 'Recommendations', page: 10),
      ],
    ),
  ];

  late final PdfController _pdfController;
  bool _sidebarOpen = true;
  int _currentPage = 1;
  int _totalPages = 1;

  @override
  void initState() {
    super.initState();
    final document = PdfDocument.openAsset(_pdfAssetPath);
    _pdfController = PdfController(document: document, initialPage: _currentPage);
    document.then(
      (doc) {
        if (mounted) setState(() => _totalPages = doc.pagesCount);
      },
      // PdfView renders the load error itself, so nothing to do here.
      onError: (_) {},
    );
  }

  @override
  void dispose() {
    _pdfController.document.then(
      (doc) => doc.close(),
      onError: (_) {},
    );
    _pdfController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    // Page controller only exists once the document has loaded.
    if (_pdfController.loadingState.value != PdfLoadingState.success) return;
    final target = page.clamp(1, _totalPages);
    _pdfController.animateToPage(
      target,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
    setState(() => _currentPage = target);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightBg,
      body: Column(
        children: [
          ReaderToolbar(
            title: 'Event Tool phase 2_ Figma and flow Review',
            currentPage: _currentPage,
            totalPages: _totalPages,
            onMenuPressed: _showMenu,
            onToggleSidebar: _toggleSidebar,
            onPreviousPage: () => _goToPage(_currentPage - 1),
            onNextPage: () => _goToPage(_currentPage + 1),
          ),
          Expanded(
            child: Row(
              children: [
                PDFSidebar(
                  isOpen: _sidebarOpen,
                  sections: _sidebarSections,
                  selectedPage: _currentPage,
                  onItemSelected: _goToPage,
                ),
                Expanded(
                  child: Container(
                    color: AppTheme.lightBg,
                    child: PDFViewer(
                      controller: _pdfController,
                      onPageChanged: (page) => setState(() => _currentPage = page),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSidebar() {
    setState(() {
      _sidebarOpen = !_sidebarOpen;
    });
  }

  void _showMenu() {
    showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(100, 50, 0, 0),
      items: [
        const PopupMenuItem(
          value: 'search',
          child: Row(
            children: [
              Icon(Icons.search, size: 18),
              SizedBox(width: 12),
              Text('Search'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'zoom',
          child: Row(
            children: [
              Icon(Icons.zoom_in, size: 18),
              SizedBox(width: 12),
              Text('Zoom'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 'settings',
          child: Row(
            children: [
              Icon(Icons.settings, size: 18),
              SizedBox(width: 12),
              Text('Settings'),
            ],
          ),
        ),
      ],
    );
  }
}
