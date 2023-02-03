// @dart=2.9

class UserModel {
  int id;
  String fullName;
  String email;
  int phoneNumber;
  String address;
  String password;
  String image;
  int balance;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    password = json['password'];
    image = json['image'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "full_name": fullName,
      "email": email,
      "phone_number": phoneNumber,
      "address": address,
      "password": password,
      "image": image,
      "balance": balance,
    };
  }
}