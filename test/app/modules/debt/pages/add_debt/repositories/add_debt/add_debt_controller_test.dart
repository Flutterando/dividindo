import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/debt/pages/add_debt/repositories/add_debt/add_debt_controller.dart';
import 'package:dividindo/app/modules/debt/pages/add_debt/repositories/add_debt/add_debt_module.dart';

void main() {
  initModule(AddDebtModule());
  AddDebtController adddebt;

  setUp(() {
    adddebt = AddDebtModule.to.bloc<AddDebtController>();
  });

  group('AddDebtController Test', () {
    test("First Test", () {
      expect(adddebt, isInstanceOf<AddDebtController>());
    });

    test("Set Value", () {
      expect(adddebt.value, equals(0));
      adddebt.increment();
      expect(adddebt.value, equals(1));
    });
  });
}
