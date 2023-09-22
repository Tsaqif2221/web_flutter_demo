import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_flutter_demo/network/network.dart';

class UserRepository {
  static Future<dynamic> getUsers() async {
    FormData fromData = FormData.fromMap({});
    Dio dio = Dio();
    var Response = await dio.get(
      NetworkURL.getUsers(),
      data: fromData,
    );
    if (Response.statusCode == 200) {
      if (kDebugMode) {
        print(Response.data);
      }
      return jsonDecode(Response.data);
    } else {
      return jsonDecode(Response.data);
    }
  }

  static Future<dynamic> insertUsers(
    String nama,
    String phone,
    String email,
  ) async {
    FormData fromData = FormData.fromMap({
      "nama": nama,
      "phone": phone,
      "email": email,
    });
    Dio dio = Dio();
    final Response = await dio.post(
      NetworkURL.TambahUser(),
      data: fromData,
    );
    if (Response.statusCode == 200) {
      return jsonDecode(Response.data);
    } else {
      return jsonDecode(Response.data);
    }
  }

  static Future<dynamic> Update(
    int id,
    String nama,
    String phone,
    String email,
  ) async {
    FormData fromData = FormData.fromMap({
      "id": id,
      "nama": nama,
      "phone": phone,
      "email": email,
    });
    Dio dio = Dio();
    final Response = await dio.post(
      NetworkURL.updateUsers(),
      data: fromData,
    );
    if (Response.statusCode == 200) {
      return jsonDecode(Response.data);
    } else {
      return jsonDecode(Response.data);
    }
  }

  static Future<dynamic> Delete(
    int id,
  ) async {
    FormData fromData = FormData.fromMap({
      "id": id,
    });
    Dio dio = Dio();
    final Response = await dio.post(
      NetworkURL.deleteUsers(),
      data: fromData,
    );
    if (Response.statusCode == 200) {
      return jsonDecode(Response.data);
    } else {
      return jsonDecode(Response.data);
    }
  }
}
