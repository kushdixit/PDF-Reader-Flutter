import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PDFViewer extends StatelessWidget {
  final PdfController controller;
  final ValueChanged<int> onPageChanged;

  const PDFViewer({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PdfView(
      controller: controller,
      onPageChanged: (page) => onPageChanged(page + 1),
      scrollDirection: Axis.vertical,
      pageSnapping: true,
    );
  }
}
