import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/debt/debt_page.dart';

main() {
  testWidgets('DebtPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(DebtPage(title: 'Debt')));
    final titleFinder = find.text('Debt');
    expect(titleFinder, findsOneWidget);
  });
}
