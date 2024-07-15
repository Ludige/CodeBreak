import 'model_language.dart';

class Profile {
  String? id;
  late String name;
  late String email;
  late String password;
  late String? image;
  late int? birthDate;
  late int? creationDate;
  List<dynamic> followingObjectId = List.empty(growable: true);
  List<dynamic> followersObjectId = List.empty(growable: true);
  List<dynamic> languages = List.empty(growable: true);
  late int? sequencialDays;
  late int? hearts;

//TODO MUDAR INT de DATAS DO BANCO PRA STRING
  Profile({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.creationDate,
    this.birthDate,
    this.sequencialDays = 0,
    this.hearts = 5,
  });

  Profile.fromMap(Map map) {
    id = map["_id"];
    name = map["name"];
    email = map["email"];
    image = map["image"];
    birthDate = map["birthDate"];
    creationDate = map["creationDate"] as int;
    followingObjectId = map["followingObjectId"] as List<dynamic>;
    followersObjectId = map["followersObjectId"] as List<dynamic>;
    languages = map["languages"] as List<dynamic>;
    sequencialDays = map["sequencialDays"];
    hearts = map["hearts"];
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
        "followingObjectId": followingObjectId,
        "followersObjectId": followersObjectId,
        "languages": languages,
        "sequencialDays": sequencialDays,
        "hearts": hearts,
      };
}
