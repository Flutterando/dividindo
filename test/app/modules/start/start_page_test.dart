import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:dividindo/app/modules/start/start_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('StartPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(StartPage()));
    final titleFinder = find.text('Start');
    expect(titleFinder, findsOneWidget);
  });
}
