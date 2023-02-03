//@dart=2.9

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoexsmass/models/filemodel.dart';
import 'package:shoexsmass/models/usermodel.dart';
import 'package:shoexsmass/shared/global.dart';

class UserService {
  
  Future<UserModel> register({
    String fullName,
    String email,
    int phoneNumber,
    String password
  }) async {
    var url = "$baseUrl/user";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = {
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'password': password
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body)
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

  Future<UserModel> login({
    String email,
    String password
  }) async {
    var url = "$baseUrl/user/login";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = {
      'email': email,
      'password': password
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body)
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

  Future<bool> emailCheck({
    String email,
  }) async {
    var url = "$baseUrl/user/check";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = {
      'email': email,
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body)
    );

    var data = jsonDecode(response.body)['data'];
    bool available = data['is_available'];

    return available;
  }

  // Future<bool> uploadAvatar({
  //   FileModel image,
  //   int userId
  // }) async {
  //   var form = new FormData();
  //   var files = {
  //     'uri': image.uri,
  //     'name': image.name,
  //     'type': image.type
  //   };
  //   form.append('avatar', jsonEncode(files));

  //   var url = "$baseUrl/user/avatar/$userId";
  //   var headers = {
  //     'Content-Type': 'multipart/form-data',
  //   };
  //   var body = form;

  //   var response = await http.post(
  //     url,
  //     headers: headers,
  //     body: body
  //   );

  //   var data = jsonDecode(response.body)['data'];
  //   bool available = data['is_uploaded'];

  //   return available;
  // }

  Future<UserModel> fetch({
    int userId
  }) async {
    var url = "$baseUrl/user/$userId";
    var headers = {
      "Content-Type" : "application/json"
    };
    var response = await http.get(
      url,
      headers: headers,
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

  Future<UserModel> update({
    int id,
    String fullName,
    String email,
    int phoneNumber,
    String address,
    String password,
    int balance,
  }) async {
    var url = "$baseUrl/user/update";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = {
      "id": id,
      "full_name": fullName,
      "email": email,
      "phone_number": phoneNumber,
      "address": address,
      "password": password,
      "balance": balance
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body)
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

}