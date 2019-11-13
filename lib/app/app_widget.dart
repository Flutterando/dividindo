import 'package:dividindo/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'modules/start/start_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dividindo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeModule(), 
        '/home': (context) => HomeModule(), 
      },
    );
  }
}
