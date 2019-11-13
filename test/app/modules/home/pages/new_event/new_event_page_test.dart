import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/home/pages/new_event/new_event_page.dart';

main() {
  testWidgets('NewEventPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(NewEventPage(title: 'NewEvent')));
    final titleFinder = find.text('NewEvent');
    expect(titleFinder, findsOneWidget);
  });
}
