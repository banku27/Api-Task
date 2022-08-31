import 'dart:convert';
import 'dart:developer';

import 'package:apiii/user_model..dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();
  static Future<Users?> getUsers() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.https('reqres.in', '/api/users');

    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      log('loaded users successfully');
      return Users.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}

Future<Users> fetchData() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users'));
  if (response.statusCode == 200) {
    log('loaded users successfully');
    return Users.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to load Users');
  }
}
