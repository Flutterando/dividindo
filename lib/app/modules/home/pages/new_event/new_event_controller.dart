import 'dart:convert';

import 'package:dividindo/app/modules/home/pages/new_event/repositories/new_event_repository.dart';
import 'package:dividindo/app/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'new_event_controller.g.dart';

class NewEventController = _NewEventBase with _$NewEventController;

abstract class _NewEventBase with Store {
  final NewEventRepository repository;
  final SharedPreferences shared;
  final nameController = TextEditingController();

  _NewEventBase(this.repository, this.shared);

  @observable
  String nameErrro;

  @observable
  bool isLoadind = false;

  @action
  Future<bool> save() async {
    
    isLoadind = true;
    if (nameController.text == null || nameController.text == "") {
      nameErrro = "O nome é obrigatório.";
      isLoadind = false;
      return false;
    }

    var jsonShared = shared.getString("userModel");

    if (jsonShared == null) {
      //TODO Efetuar Logoff
      isLoadind = false;
      return false;
    }

    UserModel model = UserModel.fromJson(json.decode(jsonShared));

    var id = await repository.addNewEvent(nameController.text, model.id);

    nameErrro = null;
    
    return id != null;
  }
}
