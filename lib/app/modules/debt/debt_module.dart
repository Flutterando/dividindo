import 'package:dividindo/app/app_module.dart';
import 'package:dividindo/app/modules/debt/repositories/debt_repository.dart';
import 'package:dividindo/app/modules/debt/debt_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:dividindo/app/modules/debt/debt_page.dart';
import 'package:hasura_connect/hasura_connect.dart';

class DebtModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => DebtController(i.get())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => DebtRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  Widget get view => DebtPage();

  static Inject get to => Inject<DebtModule>.of();
}
