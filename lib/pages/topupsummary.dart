import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/models/topupmodel.dart';
import 'package:shoexsmass/services/topupservice.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/backbutton.dart';
import 'package:shoexsmass/widgets/custombutton.dart';
import 'package:shoexsmass/widgets/paymentsum.dart';
import 'package:shoexsmass/widgets/paymethod.dart';
import 'package:shoexsmass/widgets/ssmpaydata.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TopUpSummary extends StatefulWidget {
  int topUp;
  TopUpSummary(this.topUp);

  @override
  State<TopUpSummary> createState() => _TopUpSummaryState();
}

class _TopUpSummaryState extends State<TopUpSummary> {
  var paymentUrl = '';
  var loading = false;

  void onTopUp() async {
    this.setState(() {
      loading = true;
    });
    var userState = context.read<UserCubit>().state;
    var order_id = Random().nextInt(10000).toString() + Random().nextInt(1000).toString();
    if (userState is UserFetchingSuccess) {
      TopUpModel response = await TopUpService().createTopUp(
        userId: userState.user.id,
        orderId: order_id,
        grossAmount: widget.topUp + (widget.topUp * 10) ~/ 100
      );
      this.setState(() {
        paymentUrl = response.paymentUrl;
      });
    }
    this.setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 25, left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackButtonCustom(
              onPress: () {
                Navigator.pop(context);
              },
              secondary: true,
            ),
            Text(
              "Top Up Summary",
              style: poppinsText.copyWith(
                  fontSize: 14, fontWeight: semiBold, color: black),
            ),
            Container(
              width: 26,
            )
          ],
        ),
      );
    }

    Widget ssmpaydataarea() {
      return Container(
        margin: EdgeInsets.only(top: 27, left: 24, right: 24),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserFetching) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserFetchingSuccess) {
              return SsmPayData(
                balance: state.user.balance,
                plus: widget.topUp,
                name: state.user.fullName,
                phoneNumber: state.user.phoneNumber.toString(),
              );
            }
            return Container();
          },
        ),
      );
    }

    Widget paymentSumArea() {
      return Container(
        margin: EdgeInsets.only(top: 24, left: 24, right: 24),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserFetching) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserFetchingSuccess) {
              return PaymentSum(
                phoneNumber: state.user.phoneNumber.toString(),
                topUp: "IDR. " + formatter(widget.topUp),
                tax: "IDR. " + formatter((widget.topUp * 10) ~/ 100),
                total: "IDR. " + formatter(widget.topUp + (widget.topUp * 10) ~/ 100),
              );
            }
            return Container();
          },
        ),
      );
    }

    Widget paymentMethodArea() {
      return Container(
        margin: EdgeInsets.only(top: 32, left: 24, right: 24),
        child: PayMethod(),
      );
    }

    Widget bottomButtonArea() {
      return Container(
        padding: EdgeInsets.only(bottom: 32),
        margin: EdgeInsets.only(top: 63),
        child: Column(
          children: [
            Container(
              height: 1,
              color: line,
              margin: EdgeInsets.only(bottom: 32),
            ),
            loading ? 
              Center(
                child: CircularProgressIndicator(),
              )
            : Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: CustomButton(
              title: "Top Up Now",
              onPress: () {
                onTopUp();
            }))
          ],
        ),
      );
    }

    return paymentUrl != '' ? 
      Scaffold(
        appBar: AppBar(
          title: Text("Payment"),
          backgroundColor: orange1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: (){
              this.setState(() {
                paymentUrl = "";
              });
              Timer(Duration(seconds: 1), () {
                Navigator.pushNamed(context, "/top-up-success");
              });
            },
          ),
        ),
        body: WebView(
          initialUrl: paymentUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      )
    : Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              header(),
              ssmpaydataarea(),
              Container(
                margin: EdgeInsets.only(top: 24),
                height: 1,
                color: line,
              ),
              paymentSumArea(),
              paymentMethodArea(),
              bottomButtonArea()
            ],
          ),
        ),
      ),
    );
  }
}
