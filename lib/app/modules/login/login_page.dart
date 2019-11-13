import 'package:dividindo/app/modules/login/login_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var controller = LoginModule.to.bloc<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          FlutterLogo(),
          Observer(
            builder: (_) => TextField(
              decoration: InputDecoration(
                labelText: "Email:",
                errorText: controller.passworError,
              ),
              controller: controller.emailController,
            ),
          ),
          Observer(
            builder: (_) => TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha:",
                errorText: controller.emailError,
              ),
              controller: controller.passwordController,
            ),
          ),
          RaisedButton(
            onPressed: () async {
              var login = await controller.login();

              if (login) {
                await showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("Sucesso"),
                      );
                    });
              } else {
                await showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("Fail"),
                      );
                    });
              }
            },
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}
