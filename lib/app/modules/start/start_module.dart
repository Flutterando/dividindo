import 'package:dividindo/app/app_module.dart';
import 'package:dividindo/app/modules/start/start_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:dividindo/app/modules/start/start_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => StartController(AppModule.to.get<SharedPreferences>())),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => StartPage();

  static Inject get to => Inject<StartModule>.of();
}
