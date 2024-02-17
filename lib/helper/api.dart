import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String uri, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(uri), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("wrong");
    }
  }

  Future<dynamic> post(
      {required String uri,
      @required String? token,
      @required dynamic body}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(uri), headers: headers, body: body);
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("wrong");
    }
  }

  Future<dynamic> put(
      {required String uri,
      @required String? token,
      @required dynamic body}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll(
        {'Authorization': 'Bearer $token'},
      );
    }
    http.Response response =
        await http.put(Uri.parse(uri), headers: headers, body: body);
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception("wrong");
    }
  }
}
