import 'package:dividindo/app/modules/home/home_module.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border.all(width: 2, color: Theme.of(context).accentColor)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 30,
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                FlutterLogo(
                  size: 100,
                  colors: Colors.purple,
                ),
                SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (_) => TextField(
                    decoration: InputDecoration(
                      labelText: "Email:",
                      // errorText: controller.passworError,
                    ),
                    controller: controller.emailController,
                  ),
                ),
                Observer(
                  builder: (_) => TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha:",
                      // errorText: controller.emailError,
                    ),
                    controller: controller.passwordController,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async {
                      var login = await controller.login();

                      if (login) {
                        Navigator.of(context).pushReplacementNamed("/home");
                      } else {
                        await showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text("Login ou senha inválida"),
                            );
                          },
                        );
                      }
                    },
                    child: Text("Login",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.button.color)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Versão 1.0",
                  style: TextStyle(
                      color: Colors.black.withOpacity(.2),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
