import 'dart:convert';

import 'package:iteacher/core/services/api_service.dart';

class GeminiService {
  final ApiService _api = ApiService();
  final _baseUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=";
  Future<Map<String, dynamic>> askGemini({
    required String question,
    String? imageBase64,
  }) async {
    final apiKey = 'AIzaSyCnAXaAQ0INOQexO2NUsnTcz-xRoENHYW8';
    final headers = {'Content-Type': 'application/json'};

    final List<Map<String, dynamic>> parts = [
      {"text": question}
    ];

    if (imageBase64 != null) {
      parts.add({
        "inline_data": {
          "mime_type": "image/jpeg",
          "data": imageBase64,
        }
      });
    }

    final response = await _api.post(
      url: _baseUrl + apiKey,
      headers: headers,
      body: {
        "contents": [
          {
            "parts": parts,
          }
        ]
      },
    );
    return json.decode(response);
  }
}
