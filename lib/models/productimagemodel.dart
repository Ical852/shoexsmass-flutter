// @dart=2.9

class ProductImageModel {
  int id;
  int productId;
  String image;

  ProductImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'image': image,
    };
  }
}