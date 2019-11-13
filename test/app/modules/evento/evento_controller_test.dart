import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:dividindo/app/modules/evento/evento_controller.dart';
import 'package:dividindo/app/modules/evento/evento_module.dart';
import 'package:flutter_test/flutter_test.dart';

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
  
  });
}
