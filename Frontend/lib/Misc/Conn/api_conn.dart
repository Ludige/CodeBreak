import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/model_profile.dart';
import 'api_routes.dart';

class ApiConnections {
  static final Map<String, String> _headerDefault = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
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
        'creationDate': profile.creationDate,
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
}
