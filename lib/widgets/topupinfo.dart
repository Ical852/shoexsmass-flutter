import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class TopUpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 14),
      height: 45,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(
          color: grey
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 19,
            margin: EdgeInsets.only(
              right: 16
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/iccreditcard.png")
              )
            ),
          ),
          Expanded(
            child: Text(
              "Top Up Smm Pay Now With Promo",
              style: poppinsText.copyWith(
                fontSize: 12,
                fontWeight: regular,
                color: black
              ),
            ),
          ),
          Container(
            width: 10,
            height: 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/icright.png")
              )
            ),
          )
        ],
      ),
    );
  }
}