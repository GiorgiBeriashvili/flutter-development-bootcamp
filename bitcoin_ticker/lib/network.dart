import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkClient {
  static Future<dynamic> get(String url) async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
