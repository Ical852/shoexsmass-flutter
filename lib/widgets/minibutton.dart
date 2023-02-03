import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class MiniButton extends StatelessWidget {
  String title;
  Function() onPress;

  MiniButton({required this.title, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 165,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [orange2, orange1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2))
          ]
        ),
        child: Center(
          child: Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 16,
              fontWeight: medium,
              color: white
            ),
          ),
        ),
      ),
    );
  }
}