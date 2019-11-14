import 'dart:convert';

import 'package:dividindo/app/modules/debt/pages/add_debt/repositories/add_debt_repository.dart';
import 'package:dividindo/app/shared/models/event_model.dart';
import 'package:dividindo/app/shared/models/event_model_user_dto.dart';
import 'package:dividindo/app/shared/models/user_debts_model.dart';
import 'package:dividindo/app/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_debt_controller.g.dart';

class AddDebtController = _AddDebtBase with _$AddDebtController;

abstract class _AddDebtBase with Store {
  final AddDebtRepository addDebtRepository;
  final SharedPreferences shared;

  _AddDebtBase(this.addDebtRepository, this.shared,
      {this.selectedEventModelUserDto}) {
    var jsonvar = shared.getString("userModel");
    user = UserModel.fromJson(json.decode(jsonvar));

    if (selectedEventModelUserDto == null) {
      var lastEventModelUser = shared.getString("lastEventModelUser");
      if (lastEventModelUser != null) {
        selectedEventModelUserDto =
            EventModelUserDto.fromJson(json.decode(lastEventModelUser));
      }
    }
  }

  UserModel user;

  EventModelUserDto selectedEventModelUserDto;

  var nameEditController = TextEditingController();
  var valueEditController = TextEditingController();

  @observable
  bool isLoadind = false;

  @observable
  String eventUserError;

  @action
  Future<List<EventModelUserDto>> getEventUser(String filter) async {
    return await addDebtRepository.getEventUser(filter, user.id);
  }

  @action
  Future<bool> save() async {
    if (selectedEventModelUserDto?.idEventUser == null) {
      eventUserError = "Evento é obrigatório";
      return false;
    }

    shared.setString(
        "lastEventModelUser", json.encode(selectedEventModelUserDto.toJson));

    try {
      var model = await addDebtRepository.createUserDebts(
        UserDebtsModel(
            name: nameEditController.text,
            value: double.parse(valueEditController.text),
            paidOut: true,
            idEventUser: selectedEventModelUserDto.idEventUser),
      );

      return model.id != null;
    } catch (e) {
      return false;
    }
  }
}
