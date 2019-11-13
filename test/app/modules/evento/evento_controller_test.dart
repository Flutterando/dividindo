import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/evento/evento_controller.dart';
import 'package:dividindo/app/modules/evento/evento_module.dart';

void main() {
  initModule(EventoModule());
  EventoController evento;

  setUp(() {
    evento = EventoModule.to.bloc<EventoController>();
  });

  group('EventoController Test', () {
    test("First Test", () {
      expect(evento, isInstanceOf<EventoController>());
    });

    test("Set Value", () {
      expect(evento.value, equals(0));
      evento.increment();
      expect(evento.value, equals(1));
    });
  });
}
