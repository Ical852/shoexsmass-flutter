//@dart=2.9

import 'dart:convert';

import 'package:shoexsmass/models/categorymodel.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  
  Future<List<CategoryModel>> getCategory() async {
    var url = "$baseUrl/category";
    var headers = {"Content-Type": "application/json"};
    var response = await http.get(
      url,
      headers: headers,
    );
    
    List data = jsonDecode(response.body)['data'];
    List<CategoryModel> categories = [];
    for (var item in data) {
      categories.add(CategoryModel.fromJson(item));
    }

    return categories;
  }
}