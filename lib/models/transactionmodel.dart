//@dart=2.9

import 'package:shoexsmass/models/transactiondetailmodel.dart';
import 'package:shoexsmass/models/usermodel.dart';

class TransactionModel {
  int id;
  int userId;
  String payMethod;
  String orderId;
  int grossAmount;
  String status;
  String paymentUrl;
  UserModel user;
  List<TransactionDetailModel> transactionDetail;

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    payMethod = json['pay_method'];
    orderId = json['order_id'];
    grossAmount = json['gross_amount'];
    status = json['status'];
    paymentUrl = json['payment_url'];
    user = UserModel.fromJson(json['user']);
    transactionDetail = json['transaction_detail'] != null && json['transaction_detail'].length > 0 ? json['transaction_detail'].map<TransactionDetailModel>((tdmodel) => TransactionDetailModel.fromJson(tdmodel)).toList() : [];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'pay_method': payMethod,
      'order_id': orderId,
      'gross_amount': grossAmount,
      'status': status,
      'payment_url': paymentUrl,
      'user': user.toJson(),
      'transaction_detail': transactionDetail.map((tdetail) => tdetail.toJson()).toList(),
    };
  }
}