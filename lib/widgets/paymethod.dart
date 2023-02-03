import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class PayMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 132,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Method",
            style: poppinsText.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: black
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14
            ),
            height: 48,
            margin: EdgeInsets.only(
              top: 16
            ),
            decoration: BoxDecoration(
              color: white,
              border: Border.all(
                color: grey
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Container(
                  width: 17,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/icmidtrans.png")
                    )
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 11
                    ),
                    child: Text(
                      "Midtrans Payment",
                      style: poppinsText.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        color: black
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 24,
                  width: 21,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/icdown.png")
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}