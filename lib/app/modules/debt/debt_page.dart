import 'package:dividindo/app/modules/debt/debt_module.dart';
import 'package:dividindo/app/modules/debt/pages/add_debt/add_debt_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'debt_controller.dart';

class DebtPage extends StatefulWidget {
  final String title;
  const DebtPage({Key key, this.title = "Debt"}) : super(key: key);

  @override
  _DebtPageState createState() => _DebtPageState();
}

class _DebtPageState extends State<DebtPage> {
  var controller = DebtModule.to.bloc<DebtController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          final userDebts = controller.userDebtsObservable.value;
          if (userDebts == null) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemCount: userDebts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(userDebts[index].name),
                trailing: Text("${userDebts[index].value}"),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            await Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              barrierDismissible: true,
              pageBuilder: (BuildContext context, _, __) => AddDebtModule()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
