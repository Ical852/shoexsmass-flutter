//@dart=2.9

import 'dart:convert';

import 'package:shoexsmass/models/notifmodel.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:http/http.dart' as http;

class UserNotifService {

  Future<NotifModel> createNotif({
    int userId,
    String message,
    String date,
  }) async {
    var url = '$baseUrl/notif';
    var headers = {"Content-Type": "application/json"};
    var body = {
      "user_id": userId,
      "message": message,
      "date": date
    };

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    NotifModel notif = NotifModel.fromJson(data);

    return notif;
  }

  Future<NotifModel> getById({
    int id,
  }) async {
    var url = '$baseUrl/notif/$id';
    var headers = {"Content-Type": "application/json"};
    
    var response = await http.get(
      url,
      headers: headers,
    );

    var data = jsonDecode(response.body)['data'];
    NotifModel notif = NotifModel.fromJson(data);

    return notif;
  }

  Future<List<NotifModel>> getByUserId({
    int userId,
  }) async {
    var url = '$baseUrl/notif/user/$userId';
    var headers = {"Content-Type": "application/json"};
    
    var response = await http.get(
      url,
      headers: headers,
    );
    List data = jsonDecode(response.body)['data'];
    List<NotifModel> notifs = [];
    for (var item in data) {
      notifs.add(NotifModel.fromJson(item));
    }

    return notifs;
  }

  Future<NotifModel> delete({
    int id,
  }) async {
    var url = '$baseUrl/notif/$id';
    var headers = {"Content-Type": "application/json"};
    
    var response = await http.delete(
      url,
      headers: headers,
    );
    var data = jsonDecode(response.body)['data'];
    NotifModel notif = NotifModel.fromJson(data);

    return notif;
  }
}