import 'package:dividindo/app/modules/debt/pages/add_debt/add_debt_controller.dart';
import 'package:dividindo/app/modules/debt/pages/add_debt/add_debt_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';


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
  });
}
