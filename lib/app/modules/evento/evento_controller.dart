import 'dart:convert';

import 'package:dividindo/app/modules/evento/repositories/evento_repository.dart';
import 'package:dividindo/app/shared/models/event_model.dart';
import 'package:dividindo/app/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'evento_controller.g.dart';

class EventoController = _EventoBase with _$EventoController;

abstract class _EventoBase with Store {
  final EventoRepository _eventoRepository;
  final SharedPreferences shared;

  _EventoBase(this._eventoRepository, this.shared) {
    refresh();
  }

  @observable
  List<EventModel> eventos = List<EventModel>();

  @observable
  bool isLoading = true;

  @action
  void refresh() {
    isLoading = true;
    _eventoRepository.getEvents().then((data) {      
      eventos = data;
      isLoading = false;
    });
  }

  @action
  void remove(eventId) {
    var jsonShared = shared.getString("userModel");

    if (jsonShared == null) {
      //TODO Efetuar Logoff
      return;
    }

    UserModel model = UserModel.fromJson(json.decode(jsonShared));
    isLoading = true;
    _eventoRepository.deleteEvent(eventId, model.id).then((data) {
      refresh();
    });
  }
}
