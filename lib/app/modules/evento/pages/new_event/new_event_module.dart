import 'package:dividindo/app/app_module.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_event_controller.dart';
import 'new_event_page.dart';
import 'repositories/new_event_repository.dart';

class NewEventModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => NewEventController(i.get(), AppModule.to.get<SharedPreferences>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency(
            (i) => NewEventRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  Widget get view => NewEventPage();

  static Inject get to => Inject<NewEventModule>.of();
}
