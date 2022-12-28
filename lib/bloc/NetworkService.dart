import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkService {
  var authToken = "";
  Future<http.Response?> get(
    String endpoint,
    // Map<String, String>? body,
  ) async {
    var map = new Map<String, String>();
    // map['x-auth'] = authToken;

    // String queryString = Uri(queryParameters: body).query;
    final response = await http.get(
      Uri.parse(endpoint),
      // + "?" + queryString),
      headers: map,
    ) /* .timeout(Duration(seconds: 120)) */;
    return response;
  }
  //
  // Future<http.Response?> post(
  //   String endpoint,
  //   Map<String, dynamic>? body,
  //   bool isformdata,
  // ) async {
  //   print(endpoint);
  //
  //   var map = new Map<String, String>();
  //   // map['x-auth'] = authToken;
  //
  //   final jsonString = json.encode(body);
  //
  //   final response =
  //       await http.post(Uri.parse(endpoint), headers: map, body: jsonString);
  //   return response;
  // }

  setToken(String token) {
    authToken = token;
  }
}
