//@dart=2.9

import 'dart:convert';

import 'package:shoexsmass/models/transactionmodel.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  
  Future<TransactionModel> createTransaction({
    int userId,
    String orderId,
    int grossAmount,
    String payMethod,
    List<Map<String, int>> tdDetail
  }) async {
    var url = '$baseUrl/transaction';
    var headers = {"Content-Type": "application/json"};
    var body = {
      "user_id": userId,
      "order_id": orderId,
      "gross_amount": grossAmount,
      "pay_method": payMethod,
      "td_detail": tdDetail
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body)
    );

    print(response);

    var data = jsonDecode(response.body)['data'];
    TransactionModel transaction = TransactionModel.fromJson(data);

    return transaction;
  }

  Future<TransactionModel> getById({
    int id,
  }) async {
    var url = '$baseUrl/transaction/$id';
    var headers = {"Content-Type": "application/json"};

    var response = await http.get(
      url,
      headers: headers,
    );

    var data = jsonDecode(response.body)['data'];
    TransactionModel transaction = TransactionModel.fromJson(data);

    return transaction;
  }

  Future<List<TransactionModel>> getByUserId({
    int userId,
  }) async {
    var url = '$baseUrl/transaction/user/$userId';
    var headers = {"Content-Type": "application/json"};

    var response = await http.get(
      url,
      headers: headers,
    );

    List data = jsonDecode(response.body)['data'];
    List<TransactionModel> transactions = [];
    if (data == null) {
      return [];
    }

    for (var item in data) {
      transactions.add(TransactionModel.fromJson(item));
    }
    return transactions;
  }
}