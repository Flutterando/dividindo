import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dividindo/app/app_controller.dart';
import 'package:dividindo/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends ModuleWidget {
  final SharedPreferences sharedPreferences;

  AppModule(this.sharedPreferences);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency<HasuraConnect>((i) => HasuraConnect("https://flutterando-dividindo.herokuapp.com/v1/graphql")),
        Dependency<SharedPreferences>((i) => sharedPreferences),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
