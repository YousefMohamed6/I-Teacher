import 'dart:convert';

class JsonHandler {
  static Map<String, dynamic> toJson({required String body}) {
    Map<String, dynamic> json = {};
    final List<String> jsonParts = body.split('}{');
    if (jsonParts.length == 1) return jsonDecode(body);
    for (int i = 0; i < jsonParts.length; i++) {
      final String element = jsonParts[i];
      if (i % 2 == 0) {
        json.addAll(jsonDecode('$element}'));
      } else {
        json.addAll(jsonDecode('{$element'));
      }
    }
    return json;
  }
}
