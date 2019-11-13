import 'package:dividindo/app/modules/login/login_module.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
