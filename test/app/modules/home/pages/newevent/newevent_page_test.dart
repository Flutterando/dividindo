import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/home/pages/newevent/newevent_page.dart';

main() {
  testWidgets('NeweventPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(NeweventPage(title: 'Newevent')));
    final titleFinder = find.text('Newevent');
    expect(titleFinder, findsOneWidget);
  });
}
