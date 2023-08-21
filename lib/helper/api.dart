import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Api();
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is problem with Status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(Uri.parse(url),
        body: json.encode(body), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is problem with Status code ${response.statusCode}');
    }
  }

  Future<dynamic> put(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is problem with Status code ${response.statusCode}');
    }
  }
}
