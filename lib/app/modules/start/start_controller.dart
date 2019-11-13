import 'dart:convert';

import 'package:dividindo/app/shared/models/event_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'start_controller.g.dart';

class StartController = _StartBase with _$StartController;

abstract class _StartBase with Store {
  final SharedPreferences shared;

  _StartBase(this.shared);

  @action
  bool isLogged() {
    try {
      var jsonvar = shared.getString("userModel");

      if (jsonvar == null) {
        return false;
      }

      EventModel model = EventModel.fromJson(json.decode(jsonvar));

      if (model?.id != null) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
