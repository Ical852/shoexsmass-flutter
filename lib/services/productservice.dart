//@dart=2.9

import 'dart:convert';

import 'package:shoexsmass/models/productmodel.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:http/http.dart' as http;

class ProductService {
  
  Future<List<ProductModel>> getAll() async {
    var url = '$baseUrl/products';
    var headers = {"Content-Type": "application/json"};
    var response = await http.get(
      url,
      headers: headers
    );

    List data = jsonDecode(response.body)['data'];
    List<ProductModel> products = [];
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }

    return products;
  }

  Future<List<ProductModel>> getByCategoryId({ int catId }) async {
    var url = '$baseUrl/products/cat/$catId';
    var headers = {"Content-Type": "application/json"};
    var response = await http.get(
      url,
      headers: headers
    );

    List data = jsonDecode(response.body)['data'];
    List<ProductModel> products = [];
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }

    return products;
  }

  Future<ProductModel> getById({ int id }) async {
    var url = '$baseUrl/products/$id';
    var headers = {"Content-Type": "application/json"};
    var response = await http.get(
      url,
      headers: headers
    );

    var data = jsonDecode(response.body)['data'];
    ProductModel product = ProductModel.fromJson(data);

    return product;
  }
}