class EventModelUserDto {
  String id;
  String idEventUser;
  String name;

  EventModelUserDto({this.id, this.idEventUser, this.name});

  EventModelUserDto.fromJson(Map<String, dynamic> json) {
    if (json['idEventUser'] == null) {
      id = json['event']['id'];
      idEventUser = json['id'];
      name = json['event']['name'];
    } else {
      id = json['id'];
      idEventUser = json['idEventUser'];
      name = json['name'];
    }
  }

  Map<String, dynamic> get toJson => {
        'id': this.id,
        'idEventUser': this.idEventUser,
        'name': this.name,
      };

  static List<EventModelUserDto> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<EventModelUserDto>((item) => EventModelUserDto.fromJson(item))
        .toList();
  }

  @override
  String toString() => name;

  @override
  operator ==(o) => o is EventModelUserDto && o.id == id;

  @override
  int get hashCode => id.hashCode ^ idEventUser.hashCode ^ name.hashCode;
}
