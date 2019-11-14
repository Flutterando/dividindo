import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/evento/pages/event_detail/event_detail_controller.dart';
import 'package:dividindo/app/modules/evento/pages/event_detail/event_detail_module.dart';

void main() {
  initModule(EventDetailModule());
  EventDetailController eventdetail;

  setUp(() {
    eventdetail = EventDetailModule.to.bloc<EventDetailController>();
  });

  group('EventDetailController Test', () {
    test("First Test", () {
      expect(eventdetail, isInstanceOf<EventDetailController>());
    });

    test("Set Value", () {
      expect(eventdetail.value, equals(0));
      eventdetail.increment();
      expect(eventdetail.value, equals(1));
    });
  });
}
