import 'package:dio/dio.dart';

class ApiService {
  Dio get _dio => Dio();
  Future<dynamic> get({
    Map<String, String>? headers,
    required String url,
    String? token,
  }) async {
    if (token != null) {
      headers?.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await _dio.get(
      url,
      options: Options(headers: headers),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception(
          'there is problem with Status Code ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    String? token,
    Map<String, String>? headers,
  }) async {
    if (token != null) {
      headers?.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await _dio.post(
      url,
      data: body,
      options: Options(headers: headers),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception(
          'there is problem with Status Code ${response.statusCode}');
    }
  }

  Future<dynamic> put({
    required String url,
    required Map<String, dynamic> body,
    String? token,
    Map<String, String>? headers,
  }) async {
    if (token != null) {
      headers?.addAll({'Authorization': 'Bearer $token'});
    }
    Response response =
        await _dio.put(url, data: body, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is problem with Status code ${response.statusCode}');
    }
  }
}
