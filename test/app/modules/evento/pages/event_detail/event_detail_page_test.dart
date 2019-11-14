import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/evento/pages/event_detail/event_detail_page.dart';

main() {
  testWidgets('EventDetailPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(EventDetailPage(title: 'EventDetail')));
    final titleFinder = find.text('EventDetail');
    expect(titleFinder, findsOneWidget);
  });
}
