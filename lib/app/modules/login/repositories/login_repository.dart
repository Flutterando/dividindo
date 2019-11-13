import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';

class LoginRepository extends Disposable {
  @override
  void dispose() {}

  Future<bool> efetuarLogin(String email, String senha) async {
    return email == senha;
  }
}

//https://flutterando-dividindo.herokuapp.com/v1/graphql