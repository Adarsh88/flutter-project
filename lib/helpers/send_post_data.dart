import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void sendPostData(String id, String name, String email, String gender,
    String status, context) async {
  final dio = Dio();
  final Map<String, String> data = {
    "id": id,
    "name": name,
    "email": email,
    "gender": gender,
    "status": status
  };
  final response = await dio.post("https://reqres.in/api/users", data: data);
  debugPrint(response.toString());
}
