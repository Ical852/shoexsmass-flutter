// @dart=2.9

import 'package:shoexsmass/models/usermodel.dart';

class NotifModel {
  int id;
  int userId;
  String message;
  String date;
  UserModel user;

  NotifModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    message = json['message'];
    date = json['date'];
    user = UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'message': message,
      'date': date,
      'user': user.toJson(),
    };
  }
}