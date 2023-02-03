//@dart=2.9

import 'package:shoexsmass/models/usermodel.dart';

class TopUpModel {
  int id;
  int userId;
  String orderId;
  int grossAmount;
  String status;
  String paymentUrl;
  UserModel user;

  TopUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderId = json['order_id'];
    grossAmount = json['gross_amount'];
    status = json['status'];
    paymentUrl = json['payment_url'];
    user = UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'order_id': orderId,
      'gross_amount': grossAmount,
      'status': status,
      'payment_url': paymentUrl,
      'user': user.toJson(),
    };
  }
}