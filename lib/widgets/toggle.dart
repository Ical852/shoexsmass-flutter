import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class ToggleCustom extends StatelessWidget {
  String current;
  Function() leftPress;
  Function() rightPress;

  ToggleCustom({required this.current, required this.leftPress, required this.rightPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 40,
      decoration: BoxDecoration(
        color: orange5,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: leftPress,
              child: Container(
                decoration: BoxDecoration(
                  color: current == 'left' ? orange1 : orange5,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text(
                    "SsmPay",
                    style: poppinsText.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: current == 'left' ? white : black
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: rightPress,
              child: Container(
                decoration: BoxDecoration(
                  color: current == 'right' ? orange1 : orange5,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text(
                    "Manual",
                    style: poppinsText.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      color: current == 'right' ? white : black
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}