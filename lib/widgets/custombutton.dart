import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function() onPress;
  String type;
  bool disable;

  CustomButton({required this.title, required this.onPress, this.type = 'primary', this.disable = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disable ? (){}: onPress,
      child: Opacity(
        opacity: disable ? 0.5 : 1,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [type == 'primary' ? orange2 : cream, type == 'primary' ? orange1 : cream],
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
                fontWeight: semiBold,
                color: type == 'primary' ? white : black
              ),
            ),
          ),
        ),
      ),
    );
  }
}