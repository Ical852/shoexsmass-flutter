import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/paysumitem.dart';

class PaymentSum extends StatelessWidget {
  String phoneNumber;
  String topUp;
  String tax;
  String total;
  String first;
  String sec;
  String last;

  PaymentSum({
    required this.phoneNumber, 
    required this.topUp, 
    required this.tax, 
    required this.total,
    this.first = "Phone Number",
    this.sec = "Top Up Total",
    this.last = "Tax - 10%"
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 205,
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
            "Payment Summary",
            style: poppinsText.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: black
            ),
          ),
          SizedBox(height: 12,),
          PaySumItem(
            title: first,
            value: phoneNumber,
          ),
          SizedBox(height: 12,),
          PaySumItem(
            title: sec,
            value: topUp,
          ),
          SizedBox(height: 12,),
          PaySumItem(
            title: last,
            value: tax,
          ),
          Container(
            height: 1,
            color: grey,
            margin: EdgeInsets.symmetric(
              vertical: 10
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: orange1
                ),
              ),
              Text(
                total,
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: orange1
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}