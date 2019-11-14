import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final String title;
  const EventDetailPage({Key key, this.title = "EventDetail"})
      : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
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
