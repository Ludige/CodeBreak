import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/model_exercice.dart';
import '../Models/model_profile.dart';
import '../token.dart';
import 'api_routes.dart';

class ApiConnections {
  static final Map<String, String> _headerDefault = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static final Token _token = Get.put(Token());

  static final Map<String, String> _headerWithTokenWithTime = {
    'Content-Type': 'application/json; charset=UTF-8',
    'x-access-time': DateTime.now().millisecondsSinceEpoch.toString()
  };

  static Future<Profile> createProfile(Profile profile) async {
    final response = await http.post(
      Uri.parse(APIRoutes.apiUrl + APIRoutes.createProfile),
      headers: _headerDefault,
      body: jsonEncode(<String, String>{
        'name': profile.name,
        'email': profile.email,
        'password': profile.password,
        'creationDate': profile.creationDate.toString(),
      }),
    );
    if (response.statusCode == 200) {
      return Profile.fromMap(jsonDecode(response.body));
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      return Profile.defaultGetX();
    }
  }

//TODO Fazer a rota de update de perfil, pedir ajuda ao rafael quando ele puder, sem urgencia, não precisa pra entregar

  static Future<bool> followProfile(String profileId) async {
    final response = await http.post(
      Uri.parse(APIRoutes.apiUrl + APIRoutes.followProfileById(profileId)),
      headers: _headerWithTokenWithTime,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      return false;
    }
  }

  static Future<Profile> getProfileById(String id) async {
    final response = await http.get(
      Uri.parse(APIRoutes.apiUrl + APIRoutes.getProfileById(id)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': _token.token.value
      },
    );
    if (response.statusCode == 200) {
      var profilesMap = jsonDecode(response.body);
      print(profilesMap);
      return Profile.fromMap(profilesMap);
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao recuperar perfis');
    }
  }

  static Future<bool> deleteProfile(String id) async {
    final response = await http.delete(
        Uri.parse(APIRoutes.apiUrl + APIRoutes.deleteProfileById(id)),
        headers: _headerWithTokenWithTime);

    if (response.statusCode == 200) {
      return true;
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      //TODO trow expetion
      return false;
    }
  }

  //Exercices
  static Future<Exercice> getExerciceById(id) async {
    final response = await http.get(
      Uri.parse(APIRoutes.apiUrl + APIRoutes.getExerciceById(id)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-access-token': _token.token.value
      },
    );
    if (response.statusCode == 200) {
      var exercicesMap = jsonDecode(response.body);

      return Exercice.fromMap(exercicesMap);
    } else {
      print(
          "Error ${response.statusCode.toString()}: ${response.body.toString()}");
      throw Exception('Falha ao recuperar exercicios');
    }
  }

  //Lessons
  //  static Future<Lesson> getLessonById(id) async {
  //   final response = await http.get(
  //     Uri.parse(APIRoutes.apiUrl + APIRoutes.getLessonById(id)),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'x-access-token': _token.token.value
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     var lessonsMap = jsonDecode(response.body);

  //     return Lessons.fromMap(lessonsMap);
  //   } else {
  //     print(
  //         "Error ${response.statusCode.toString()}: ${response.body.toString()}");
  //     throw Exception('Falha ao recuperar lições');
  //   }
  // }
}
