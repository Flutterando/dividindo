import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/home/pages/new_group/new_group_page.dart';

main() {
  testWidgets('NewGroupPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(NewGroupPage(title: 'NewGroup')));
    final titleFinder = find.text('NewGroup');
    expect(titleFinder, findsOneWidget);
  });
}
