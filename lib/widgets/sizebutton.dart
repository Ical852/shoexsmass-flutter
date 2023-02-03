import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class SizeButton extends StatelessWidget {
  String size;
  Function() onPress;
  bool active;

  SizeButton({required this.size, required this.onPress, this.active = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          right: 12
        ),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: active ? orange1 : grey3,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text(
            size,
            style: poppinsText.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: active ? white : black
            ),
          ),
        ),
      ),
    );
  }
}