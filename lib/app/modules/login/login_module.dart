import 'package:dividindo/app/app_module.dart';
import 'package:dividindo/app/modules/login/repositories/login_repository.dart';
import 'package:dividindo/app/modules/login/login_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:dividindo/app/modules/login/login_page.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LoginController(i.get())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LoginRepository(AppModule.to.get())),
      ];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
