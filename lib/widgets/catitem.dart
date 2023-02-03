import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class CatItem extends StatelessWidget {
  String title;
  Function() onPress;
  bool active;

  CatItem({required this.title, required this.onPress, this.active = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          right: 16
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12
        ),
        decoration: BoxDecoration(
          color: active ? orange1 : white,
          border: Border.all(
            color: orange1
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Text(
          title,
          style: poppinsText.copyWith(
            fontSize: 13,
            fontWeight: light,
            color: active ? white : orange1
          ),
        ),
      ),
    );
  }
}