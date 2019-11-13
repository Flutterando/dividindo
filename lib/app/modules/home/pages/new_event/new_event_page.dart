import 'package:dividindo/app/modules/home/pages/new_event/new_event_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'new_event_controller.dart';

class NewEventPage extends StatefulWidget {
  final String title;
  const NewEventPage({Key key, this.title = "Novo Evento"}) : super(key: key);

  @override
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  var controller = NewEventModule.to.bloc<NewEventController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Nome do Evento:",
                  errorText: controller.nameErrro,
                ),
                controller: controller.nameController,
              ),
              Observer(
                builder: (_) {
                  return GestureDetector(
                    onTap: controller.isLoadind
                        ? null
                        : () async {
                            var saved = await controller.save();

                            if (saved) {
                              Navigator.of(context).pop();
                            }
                          },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: controller.isLoadind
                              ? BorderRadius.circular(100)
                              : null),
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(10),
                      width: controller.isLoadind ? 40 : 400,
                      child: controller.isLoadind
                          ? SizedBox(
                              child: CircularProgressIndicator(strokeWidth: 2, valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),),
                              height: 20,
                              width: 20,
                            )
                          : Text(
                              "Salvar",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).textTheme.button.color),
                            ),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
