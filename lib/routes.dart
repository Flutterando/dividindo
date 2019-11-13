import 'package:flutter/material.dart';

import 'app/modules/evento/evento_module.dart';
import 'app/modules/home/home_module.dart';
import 'app/modules/login/login_module.dart';
import 'app/modules/start/start_module.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => StartModule(),
      );
    case 'home':
      return MaterialPageRoute(
        builder: (_) => HomeModule(),
      );
    case 'login':
      return MaterialPageRoute(
        builder: (_) => LoginModule(),
      );
    case 'evento':
      return MaterialPageRoute(
        builder: (_) => EventoModule(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
