class EventModel {
  String id;
  String idUser;
  String name;
  String createdAt;

  EventModel({this.id, this.idUser, this.name, this.createdAt});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    name = json['name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> get toJson => {
    'id': this.id,
    'id_user': this.idUser,
    'name': this.name,
    'created_at': this.createdAt,
  };

    @override
  String toString() => '$toJson';
}
