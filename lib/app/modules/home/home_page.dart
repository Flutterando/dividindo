import 'package:dividindo/app/modules/home/pages/new_event/new_event_module.dart';
import 'package:dividindo/app/modules/login/login_module.dart';
import 'package:dividindo/app/shared/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.C6F3980,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(FontAwesomeIcons.commentDollar),
              SizedBox(width: 10),
              Text('Dividindo'),
            ],
          ),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
                padding: EdgeInsets.all(1),
                elevation: 10,
                offset: Offset(0, 50),
                icon: Icon(FontAwesomeIcons.ellipsisV),
                itemBuilder: (context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        value: 0,
                        child: Text('Criar Evento'),
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: Text('Ver Eventos'),
                      ),
                      PopupMenuDivider(
                        height: 10,
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('Sair'),
                      ),
                    ],
                onSelected: (data) async {
                  switch (data) {
                    case 0:
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          barrierDismissible: true,
                          pageBuilder: (BuildContext context, _, __) =>
                              NewEventModule()));
                      break;
                    case 1:
                      Navigator.of(context).pushNamed("evento");

                      break;
                    case 2:
                      var shared = await SharedPreferences.getInstance();
                      await shared.remove("userModel");
                      Navigator.of(context).pushReplacementNamed("login");

                      break;
                  }
                })
          ],
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: 200,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          onPressed: () {},
          child: Icon(Icons.attach_money),
        ));
  }
}
