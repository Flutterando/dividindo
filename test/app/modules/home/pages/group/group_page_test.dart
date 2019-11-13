import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/home/pages/group/group_page.dart';

main() {
  testWidgets('GroupPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(GroupPage(title: 'Group')));
    final titleFinder = find.text('Group');
    expect(titleFinder, findsOneWidget);
  });
}
