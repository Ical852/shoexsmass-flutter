//@dart=2.9

import 'dart:convert';

import 'package:shoexsmass/models/topupmodel.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:http/http.dart' as http;

class TopUpService {
  
  Future<TopUpModel> createTopUp({
    int userId,
    String orderId,
    int grossAmount
  }) async {
    var url = '$baseUrl/topup';
    var headers = {"Content-Type": "application/json"};
    var body = {
      "user_id": userId,
      "order_id": orderId,
      "gross_amount": grossAmount
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body)
    );

    var data = jsonDecode(response.body)['data'];
    TopUpModel topUp = TopUpModel.fromJson(data);

    return topUp;
  }

  Future<TopUpModel> getById({
    int id
  }) async {
    var url = '$baseUrl/topup/$id';
    var headers = {"Content-Type": "application/json"};

    var response = await http.get(
      url,
      headers: headers,
    );

    var data = jsonDecode(response.body)['data'];
    TopUpModel topUp = TopUpModel.fromJson(data);

    return topUp;
  }

  Future<List<TopUpModel>> getByUserId({
    int userId
  }) async {
    var url = '$baseUrl/topup/user/$userId';
    var headers = {"Content-Type": "application/json"};

    var response = await http.get(
      url,
      headers: headers,
    );

    List data = jsonDecode(response.body)['data'];
    List<TopUpModel> topUps = [];

    for (var item in data) {
      topUps.add(TopUpModel.fromJson(item));
    }

    return topUps;
  }
}