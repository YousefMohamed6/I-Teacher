import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<dynamic> get({
    Map<String, String>? headers,
    required String url,
    String? token,
  }) async {
    Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json',
    };
    defaultHeaders.addAll(headers ?? {});
    if (token != null) {
      defaultHeaders.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await _dio.get(
      url,
      options: Options(headers: defaultHeaders),
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
    Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json',
    };
    defaultHeaders.addAll(headers ?? {});
    if (token != null) {
      defaultHeaders.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await _dio.post(
      url,
      data: body,
      options: Options(headers: defaultHeaders),
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
    Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json',
    };
    defaultHeaders.addAll(headers ?? {});
    if (token != null) {
      defaultHeaders.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await _dio.put(
      url,
      data: body,
      options: Options(headers: defaultHeaders),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is problem with Status code ${response.statusCode}');
    }
  }
}
