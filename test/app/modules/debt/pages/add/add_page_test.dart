import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/debt/pages/add/add_page.dart';

main() {
  testWidgets('AddPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AddPage(title: 'Add')));
    final titleFinder = find.text('Add');
    expect(titleFinder, findsOneWidget);
  });
}
