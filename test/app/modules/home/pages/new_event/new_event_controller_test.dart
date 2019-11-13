import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/home/pages/new_event/new_event_controller.dart';
import 'package:dividindo/app/modules/home/pages/new_event/new_event_module.dart';

void main() {
  initModule(NewEventModule());
  NewEventController newevent;

  setUp(() {
    newevent = NewEventModule.to.bloc<NewEventController>();
  });

  group('NewEventController Test', () {
    test("First Test", () {
      expect(newevent, isInstanceOf<NewEventController>());
    });

    test("Set Value", () {
      expect(newevent.value, equals(0));
      newevent.increment();
      expect(newevent.value, equals(1));
    });
  });
}
