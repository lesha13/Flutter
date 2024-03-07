import 'dart:convert';
import 'package:http/http.dart' as http;

import "../models/ticker.dart";

const String baseUrl = "http://127.0.0.1:8000/api/tickers/";

Future<List<Ticker>> getTickers() async {
  var url = Uri.parse(baseUrl);
  final response = await http.get(url, headers: {"Content-Type": "application/json"});
  final List body = json.decode(response.body);
  return body.map((e) => Ticker.fromJson(e)).toList();
}

Future<Ticker?> getTicker(int id) async {
  var url = Uri.parse("$baseUrl$id");
  final response = await http.get(url, headers: {"Content-Type": "application/json"});
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);
    return Ticker.fromJson(jsonData);
  } else {
    return null;
  }
}

Future<Ticker> createTicker(Ticker ticker) async {
  var url = Uri.parse(baseUrl);
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: json.encode(ticker.toJson()),
  );

  if (response.statusCode == 201) {
    Map<String, dynamic> jsonData = json.decode(response.body);
    return Ticker.fromJson(jsonData);
  } else {
    throw Exception('Failed to create ticker');
  }
}

Future<Ticker?> updateTicker(int id, Ticker ticker) async {
  var url = Uri.parse("$baseUrl$id");
  final response = await http.put(
    url,
    headers: {"Content-Type": "application/json"},
    body: json.encode(ticker.toJson()),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);
    return Ticker.fromJson(jsonData);
  } else {
    return null;
  }
}

Future<void> deleteTicker(int id) async {
  var url = Uri.parse("$baseUrl$id");
  final response = await http.delete(url,headers: {"Content-Type": "application/json"});
  if (response.statusCode != 204) {
    throw Exception('Failed to delete ticker');
  }
}
