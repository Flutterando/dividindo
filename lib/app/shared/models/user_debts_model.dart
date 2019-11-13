import 'event_user_model.dart';

class UserDebtsModel {
  String id;
  String idEventUser;
  String name;
  bool paidOut;
  double value;
  String createdAt;
  EventUserModel eventUser;

  UserDebtsModel({
    this.id,
    this.idEventUser,
    this.name,
    this.paidOut,
    this.value,
    this.createdAt,
    this.eventUser,
  });

  UserDebtsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idEventUser = json['id_event_user'];
    name = json['name'];
    paidOut = json['paid_out'];
    value = json['value'];
    createdAt = json['created_at'];
    eventUser = (json['event_user'] != null)
        ? EventUserModel.fromJson(json['event_user'])
        : EventUserModel();
  }

  Map<String, dynamic> get toJson => {
        'id': this.id,
        'id_event_user': this.idEventUser,
        'name': this.name,
        'paid_out': this.paidOut,
        'value': this.value,
        'value': this.value,
        'created_at': this.createdAt,
        'event_user': this.eventUser.toJson,
      };

  @override
  String toString() => '$toJson';
}
