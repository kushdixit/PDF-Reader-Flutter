import 'package:flutter_test/flutter_test.dart';

import 'package:pdf_reader/main.dart';
import 'package:pdf_reader/widgets/reader_toolbar.dart';

void main() {
  testWidgets('App shows the reader toolbar and outline sidebar', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.byType(ReaderToolbar), findsOneWidget);
    expect(find.text('OUTLINE'), findsOneWidget);
    expect(find.text('BOOKMARKS'), findsOneWidget);
  });
}
