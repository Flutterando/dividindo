import 'dart:convert';

import 'package:dividindo/app/modules/login/repositories/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  final LoginRepository loginRepository;
  final SharedPreferences sharedPreferences;

  _LoginBase(this.loginRepository, this.sharedPreferences);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @observable
  String emailError;

  @observable
  String passworError;

  @action
  Future<bool> login() async {
    try {
      var model = await loginRepository.efetuarLogin(
          emailController.text, passwordController.text);
      var isValid = model?.id != null;
      if (isValid) {
        var js = json.encode(model.toJson);
        await sharedPreferences.setString("userModel", js);
      }

      return isValid;
    } catch (e) {
      passwordController.text = "";
      print(e);
      return false;
    }
  }
}
