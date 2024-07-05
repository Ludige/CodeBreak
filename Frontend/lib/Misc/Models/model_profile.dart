import 'dart:ffi';

class Profile {
  String? id;
  late String name;
  late String email;
  late String password;
  String? image;
  String? birthDate;
  late String creationDate;

//TODO MUDAR INT de DATAS DO BANCO PRA STRING
  Profile({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.creationDate,
    this.birthDate,
  });

  Profile.fromMap(Map map) {
    id = map["_id"];
    name = map["name"];
    email = map["email"];
    image = map["image"];
    birthDate = map["birthDate"];
    creationDate = map["creationDate"];
  }

  Profile.defaultGetX();

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "image": image,
        "birthDate": birthDate,
        "creationDate": creationDate,
      };
}
