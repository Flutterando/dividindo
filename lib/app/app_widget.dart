import 'package:dividindo/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'modules/login/login_module.dart';
import 'modules/start/start_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dividindo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.purple,
          ),
          textTheme: TextTheme(
            button: TextStyle(color: Colors.white),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => StartModule(),
        '/home': (context) => HomeModule(),
        '/login': (context) => LoginModule(),
      },
    );
  }
}
