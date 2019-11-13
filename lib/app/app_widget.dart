import 'package:flutter/material.dart';
import '../routes.dart';
import 'shared/utils/color_app.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dividindo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.indigo,
          primaryColor: ColorApp.C6F3980,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.purple,
          ),
          textTheme: TextTheme(
            button: TextStyle(color: Colors.white),
          )),
      initialRoute: "/",
      onGenerateRoute: generateRoute,
    );
  }
}
