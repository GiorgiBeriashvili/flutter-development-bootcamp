import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkClient {
  final String url;

  NetworkClient(this.url);

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);

      return data;
    } else {
      // throw Exception('Failed to fetch the data from the following url: $url');
      print(response.statusCode);
    }
  }
}
