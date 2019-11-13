import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/home/pages/new_group/new_group_controller.dart';
import 'package:dividindo/app/modules/home/pages/new_group/new_group_module.dart';

void main() {
  initModule(NewGroupModule());
  NewGroupController newgroup;

  setUp(() {
    newgroup = NewGroupModule.to.bloc<NewGroupController>();
  });

  group('NewGroupController Test', () {
    test("First Test", () {
      expect(newgroup, isInstanceOf<NewGroupController>());
    });

    test("Set Value", () {
      expect(newgroup.value, equals(0));
      newgroup.increment();
      expect(newgroup.value, equals(1));
    });
  });
}
