//@dart=2.9

import 'package:shoexsmass/models/productmodel.dart';

class CartModel {
  ProductModel product;
  int qty;

  CartModel.set(ProductModel product, int qty) {
    this.product = product;
    this.qty = qty;
  }
}