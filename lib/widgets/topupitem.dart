import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class TopUpItem extends StatelessWidget {
  int price;
  bool active;
  Function() onPress;

  TopUpItem({required this.price, required this.onPress, this.active = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 58,
        width: (MediaQuery.of(context).size.width / 2) - 24 - 4,
        decoration: BoxDecoration(
          color: active ? orange1 : white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Text(
            formatter(price),
            style: poppinsText.copyWith(
              fontSize: 20,
              fontWeight: regular,
              color: active ? white : black
            ),
          ),
        ),
      ),
    );
  }
}