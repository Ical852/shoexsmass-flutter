//@dart=2.9

import 'package:shoexsmass/models/productmodel.dart';

class TransactionDetailModel {
  int id;
  int transactionId;
  int productId;
  int qty;
  ProductModel product;

  TransactionDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction_id'];
    productId = json['product_id'];
    qty = json['qty'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transaction_id': transactionId,
      'product_id': productId,
      'qty': qty,
      'product': product.toJson(),
    };
  }
}