import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/start/start_page.dart';

main() {
  testWidgets('StartPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(StartPage(title: 'Start')));
    final titleFinder = find.text('Start');
    expect(titleFinder, findsOneWidget);
  });
}
