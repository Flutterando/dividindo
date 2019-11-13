class UserModel {
  String id;
  String name;
  String email;
  String password;
  String createdAt;

  UserModel({this.id, this.name, this.email, this.password, this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> get toJson => {
    'id': this.id,
    'name': this.name,
    'email': this.email,
    'created_at': this.createdAt,
  };
  
  @override
  String toString() => '$toJson';
}
