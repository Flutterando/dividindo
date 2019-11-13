import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/start/start_controller.dart';
import 'package:dividindo/app/modules/start/start_module.dart';

void main() {
  initModule(StartModule());
  StartController start;

  setUp(() {
    start = StartModule.to.bloc<StartController>();
  });

  group('StartController Test', () {
    test("First Test", () {
      expect(start, isInstanceOf<StartController>());
    });

  });
}
