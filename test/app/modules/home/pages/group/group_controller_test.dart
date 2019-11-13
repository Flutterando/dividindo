import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:dividindo/app/modules/home/pages/group/group_controller.dart';
import 'package:dividindo/app/modules/home/pages/group/group_module.dart';

void main() {
  initModule(GroupModule());
  GroupController group;

  setUp(() {
    group = GroupModule.to.bloc<GroupController>();
  });

  group('GroupController Test', () {
    test("First Test", () {
      expect(group, isInstanceOf<GroupController>());
    });

    test("Set Value", () {
      expect(group.value, equals(0));
      group.increment();
      expect(group.value, equals(1));
    });
  });
}
