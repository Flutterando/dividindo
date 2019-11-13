import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:dividindo/app/modules/home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('HomePage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage()));
    final titleFinder = find.text('Home');
    expect(titleFinder, findsOneWidget);
  });
}
