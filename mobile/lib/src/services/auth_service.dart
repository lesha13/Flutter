import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://127.0.0.1:8000/api/token/";

Future<List<String>> getTokens(String username, String password) async {
  final response = await http.post(
    Uri.parse(baseUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'password': password,
      'username': username,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final access = data['access'].toString();
    final refresh = data['refresh'].toString();
    return [access, refresh];
  } else {
    throw Exception('Failed to fetch data: ${response.statusCode}');
  }
}
