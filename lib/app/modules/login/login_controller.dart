import 'package:dividindo/app/modules/login/repositories/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {
  final LoginRepository _loginRepository;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _LoginBase(this._loginRepository);

  @observable
  String emailError;

  @observable
  String passworError;

  @action
  Future<bool> login() async {
    bool valido = await _loginRepository.efetuarLogin(
        emailController.text, passwordController.text);

    emailError = "Deu no email";
    passworError = "Deu na Senha";
    return valido;
  }
}
