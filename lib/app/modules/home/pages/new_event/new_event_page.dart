import 'package:flutter/material.dart';

class NewEventPage extends StatefulWidget {
  final String title;
  const NewEventPage({Key key, this.title = "NewEvent"}) : super(key: key);

  @override
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
