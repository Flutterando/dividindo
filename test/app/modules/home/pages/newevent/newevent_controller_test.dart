import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/home/pages/newevent/newevent_controller.dart';
import 'package:dividindo/app/modules/home/pages/newevent/newevent_module.dart';

void main() {
  initModule(NeweventModule());
  NeweventController newevent;

  setUp(() {
    newevent = NeweventModule.to.bloc<NeweventController>();
  });

  group('NeweventController Test', () {
    test("First Test", () {
      expect(newevent, isInstanceOf<NeweventController>());
    });

    test("Set Value", () {
      expect(newevent.value, equals(0));
      newevent.increment();
      expect(newevent.value, equals(1));
    });
  });
}
