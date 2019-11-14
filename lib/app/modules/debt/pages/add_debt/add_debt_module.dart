import 'package:dividindo/app/app_module.dart';
import 'package:dividindo/app/modules/debt/pages/add_debt/repositories/add_debt_repository.dart';
import 'package:dividindo/app/modules/debt/pages/add_debt/add_debt_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:dividindo/app/modules/debt/pages/add_debt/add_debt_page.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddDebtModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AddDebtController(i.get(), AppModule.to.get<SharedPreferences>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => AddDebtRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  Widget get view => AddDebtPage();

  static Inject get to => Inject<AddDebtModule>.of();
}
