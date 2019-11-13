import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:dividindo/app/modules/evento/evento_page.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('EventoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(EventoPage(title: 'Evento')));
    final titleFinder = find.text('Evento');
    expect(titleFinder, findsOneWidget);
  });
}
