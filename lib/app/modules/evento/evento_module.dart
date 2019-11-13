import 'package:dividindo/app/app_module.dart';
import 'package:dividindo/app/modules/evento/repositories/evento_repository.dart';
import 'package:dividindo/app/modules/evento/evento_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:dividindo/app/modules/evento/evento_page.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventoModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) =>
            EventoController(i.get(), AppModule.to.get<SharedPreferences>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => EventoRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  Widget get view => EventoPage();

  static Inject get to => Inject<EventoModule>.of();
}
