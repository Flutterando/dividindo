import 'package:dividindo/app/modules/home/home_module.dart';
import 'package:dividindo/app/modules/login/login_module.dart';
import 'package:dividindo/app/modules/start/start_controller.dart';
import 'package:flutter/material.dart';

import 'start_module.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key key, this.title = "Start"}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var startBloc = StartModule.to.bloc<StartController>();

  checkLogin() async {
    //Esse timer é necessario para não dar erro ao redirecionar para proxima pagina sem ter carregado essa antes
    await Future.delayed(Duration(milliseconds: 500));
    if (startBloc.isLogged()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeModule(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => LoginModule(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Carregando...",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
