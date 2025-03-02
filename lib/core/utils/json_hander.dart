import 'dart:convert';

class JsonHander {
  static Map<String, dynamic> toJson({required String body}) {
    Map<String, dynamic> json = {};
    final List<String> jsonParts = body.split('}{');
    for (int i = 0; i < jsonParts.length; i++) {
      String element = jsonParts[i];
      if (i % 2 == 0) {
        json.addAll(jsonDecode('$element}'));
      } else {
        json.addAll(jsonDecode('{$element'));
      }
    }
    return json;
  }
}
