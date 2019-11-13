
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
              // NOTE CRIAR UM GRUPO
              PopupMenuItem(
                value: 0,
                child: Text('Criar Grupo'),
              ),
            ],
            onSelected: (data) async {
              switch (data) {
                case 0:
                  
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NewEventModule(),
                    ),
                    
                  );

                  break;
              }
            },
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.redAccent,
          ),
          onPressed: () async {
            var sharedPreferences = await SharedPreferences.getInstance();
            await sharedPreferences.remove("userModel");
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return LoginModule();
            }));
          },
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
