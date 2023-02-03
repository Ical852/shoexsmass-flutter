import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class SSMPay extends StatelessWidget {
  int balance;
  Function() onPress;

  SSMPay({required this.balance, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 18,
        right: 24,
        top: 11,
        bottom: 11
      ),
      height: 60,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/icscan.png")
              )
            ),
          ),
          Container(
            height: 34,
            width: 1,
            color: grey,
            margin: EdgeInsets.symmetric(
              horizontal: 18
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "IDR. " + formatter(balance),
                  style: poppinsText.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                    color: orange1
                  ),
                ),
                SizedBox(height: 2,),
                Text(
                  "Your SsmPay Right Now",
                  style: poppinsText.copyWith(
                    fontSize: 10,
                    fontWeight: regular,
                    color: grey
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: onPress,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: orange6,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/icplus.png")
                    )
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}