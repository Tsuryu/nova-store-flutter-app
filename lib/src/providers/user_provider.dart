

import 'package:flutter/material.dart';
import 'package:nova_store/src/models/user.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider {
  String _url = '192.168.0.8:3005';

  Future<User> login(String username, String password) async {
    try{
      final uri = Uri.http(_url, 'user/$username');
      final response = await http.get(uri, headers: {'password': password});
      if(response.statusCode != 200){
        return null;
      }

      final decodedData = json.decode(response.body);
      final user = new User.fromJsonMap(decodedData['User']);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> signUp(User userParam) async {
    try{
      final uri = Uri.http(_url, 'user');
      final response = await http.post(uri, headers: {'Content-Type': 'application/json'}, body: json.encode(userParam.toJson()));
      return response.statusCode == 200;
    } catch (e) {
      print(e);
      return false;
    }
  }
}