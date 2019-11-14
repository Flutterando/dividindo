import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/debt/pages/add_debt/add_debt_page.dart';

main() {
  testWidgets('AddDebtPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AddDebtPage(title: 'AddDebt')));
    final titleFinder = find.text('AddDebt');
    expect(titleFinder, findsOneWidget);
  });
}
