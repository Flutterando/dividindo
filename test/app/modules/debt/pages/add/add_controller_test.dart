import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/debt/pages/add/add_controller.dart';
import 'package:dividindo/app/modules/debt/pages/add/add_module.dart';

void main() {
  initModule(AddModule());
  AddController add;

  setUp(() {
    add = AddModule.to.bloc<AddController>();
  });

  group('AddController Test', () {
    test("First Test", () {
      expect(add, isInstanceOf<AddController>());
    });

    test("Set Value", () {
      expect(add.value, equals(0));
      add.increment();
      expect(add.value, equals(1));
    });
  });
}
