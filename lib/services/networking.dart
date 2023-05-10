import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      throw NetworkException('Failed to load data: ${response.statusCode}');
    }
  }
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);
}
