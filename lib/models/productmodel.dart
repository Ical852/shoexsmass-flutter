//@dart=2.9

import 'package:shoexsmass/models/categorymodel.dart';
import 'package:shoexsmass/models/productimagemodel.dart';

class ProductModel {
  int id;
  String name;
  int categoryId;
  String desc;
  int price;
  CategoryModel category;
  List<ProductImageModel> productImage;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    desc = json['desc'];
    price = json['price'];
    category = CategoryModel.fromJson(json['category']);
    productImage = json['product_image'].map<ProductImageModel>((pimage) => ProductImageModel.fromJson(pimage)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category_id': categoryId,
      'desc': desc,
      'price': price,
      'category': category.toJson(),
      'product_image': productImage.map((pimage) => pimage.toJson()).toList(),
    };
  }
}