import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/debt/debt_controller.dart';
import 'package:dividindo/app/modules/debt/debt_module.dart';

void main() {
  initModule(DebtModule());
  DebtController debt;

  setUp(() {
    debt = DebtModule.to.bloc<DebtController>();
  });

  group('DebtController Test', () {
    test("First Test", () {
      expect(debt, isInstanceOf<DebtController>());
    });
  
  });
}
