import 'package:dividindo/app/modules/home/pages/new_event/new_event_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'evento_controller.dart';
import 'evento_module.dart';

class EventoPage extends StatefulWidget {
  final String title;
  const EventoPage({Key key, this.title = "Evento"}) : super(key: key);

  @override
  _EventoPageState createState() => _EventoPageState();
}

class _EventoPageState extends State<EventoPage> {
  var controller = EventoModule.to.bloc<EventoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(FontAwesomeIcons.commentDollar),
            SizedBox(width: 10),
            Text(widget.title),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: controller.refresh,
            icon: Icon(Icons.refresh),
          )
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (_) => ListView.separated(
              itemCount: controller.eventos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(controller.eventos[index].name),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          builder: (_) {
                            return AlertDialog(
                              title: Text(controller.eventos[index].name),
                              content: Text("Deseja excluir esse evento?"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("SIM"),
                                  onPressed: () {
                                    controller
                                        .remove(controller.eventos[index].id);
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  textColor: Colors.redAccent,
                                  child: Text("NÃO"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                          context: context);
                    },
                    icon: Icon(FontAwesomeIcons.trash),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          ),
          Observer(
            builder: (_) {
              return controller.isLoading
                  ? Container(
                      color: Colors.black12,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              barrierDismissible: true,
              pageBuilder: (BuildContext context, _, __) => NewEventModule()));

          controller.refresh();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
