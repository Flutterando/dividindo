import 'package:dividindo/app/modules/debt/pages/add_debt/add_debt_module.dart';
import 'package:dividindo/app/shared/models/event_model_user_dto.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'add_debt_controller.dart';

class AddDebtPage extends StatefulWidget {
  final String title;

  const AddDebtPage({Key key, this.title = "AddDebt"}) : super(key: key);

  @override
  _AddDebtPageState createState() => _AddDebtPageState();
}

class _AddDebtPageState extends State<AddDebtPage> {
  var controller = AddDebtModule.to.bloc<AddDebtController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Nome:",
                  // errorText: controller.emailError,
                ),
                controller: controller.nameEditController,
              ),
              SizedBox(
                height: 20,
              ),
              FindDropdown<EventModelUserDto>(
                label: "Evento",
                onChanged: (EventModelUserDto data) {
                  controller.selectedEventModelUserDto = data;
                },
                selectedItem: controller.selectedEventModelUserDto,
                onFind: (String filter) async {
                  return controller.getEventUser(filter);
                },
                dropdownItemBuilder: (context, model, isSelected) {
                  return ListTile(
                    title: Text(model.name),
                  );
                },
                dropdownBuilder:
                    (BuildContext context, EventModelUserDto item) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black38, width: 1)),
                      color: Colors.white,
                    ),
                    child: (item?.name == null)
                        ? ListTile(
                            contentPadding: EdgeInsets.only(left: 20),
                            title: Text("No item selected"),
                          )
                        : ListTile(
                            contentPadding: EdgeInsets.only(left: 0),
                            title: Text(item.name),
                            trailing: Icon(
                              Icons.arrow_drop_down,
                              size: 40,
                            ),
                          ),
                  );
                },
              ),
              Observer(
                builder: (BuildContext context) {
                  return controller?.eventUserError != null
                      ? Text(controller.eventUserError)
                      : Container();
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Valor:",
                  // errorText: controller.emailError,
                ),
                controller: controller.valueEditController,
              ),
              SizedBox(
                height: 20,
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
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                              height: 20,
                              width: 20,
                            )
                          : Text(
                              "Salvar",
                              style: TextStyle(
                                color: Theme.of(context).textTheme.button.color,
                              ),
                            ),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                width: 400,
                child: FlatButton(
                  child: Text(
                    "Fechar",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
