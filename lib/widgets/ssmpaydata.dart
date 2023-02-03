import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class SsmPayData extends StatelessWidget {
  int balance;
  int plus;
  int minus;
  bool disable;
  String name;
  String phoneNumber;

  SsmPayData(
      {required this.balance,
      this.plus = 0,
      this.minus = 0,
      this.disable = false,
      this.name = '',
      this.phoneNumber = ''
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: disable ? 0.3 : 1,
          child: Container(
            padding: EdgeInsets.all(16),
            height: 147,
            decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                      color: black.withOpacity(0.2),
                      blurRadius: 2,
                      offset: Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          color: orange1,
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        width: 32,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/icons/icminilogo.png"))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: poppinsText.copyWith(
                                fontSize: 14, fontWeight: medium, color: black),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            phoneNumber,
                            style: poppinsText.copyWith(
                                fontSize: 14, fontWeight: medium, color: black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Current SsmPay",
                  style: poppinsText.copyWith(
                      fontSize: 12, fontWeight: regular, color: grey),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "IDR. " +
                          formatter(balance) +
                          (plus != 0 ? " + " + formatter(plus) : ''),
                      style: poppinsText.copyWith(
                          fontSize: 18, fontWeight: semiBold, color: orange1),
                    ),
                    Text(
                      (minus != 0 ? " - " + formatter(minus) : ''),
                      style: poppinsText.copyWith(
                          fontSize: 18, fontWeight: semiBold, color: red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        disable ? Container(
          height: 147,
          child: Center(
            child: Text(
              "Not Enough SsmPay !",
              style: poppinsText.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
                color: red
              ),
            ),
          ),
        ) : Container()
      ],
    );
  }
}
