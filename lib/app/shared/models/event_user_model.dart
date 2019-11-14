import 'package:dividindo/app/shared/models/user_model.dart';

import 'event_model.dart';

class EventUserModel {
  String id;
  String idEvent;
  String idUser;
  UserModel user;
  EventModel event;

  EventUserModel({this.id, this.idEvent, this.idUser, this.user, this.event});

  EventUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idEvent = json['id_event'];
    idUser = json['id_user'];
    user =
        (json['user'] != null) ? UserModel.fromJson(json['user']) : UserModel();
    event = (json['event'] != null)
        ? EventModel.fromJson(json['event'])
        : EventModel();
  }

  Map<String, dynamic> get toJson => {
        'id': this.id,
        'id_event': this.idEvent,
        'id_user': this.idUser,
        'user': this.user?.toJson,
        'created_at': this.event?.toJson,
      };

  @override
  String toString() => '$toJson';
}



