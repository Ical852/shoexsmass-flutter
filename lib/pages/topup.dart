import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/pages/topupsummary.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/backbutton.dart';
import 'package:shoexsmass/widgets/custombutton.dart';
import 'package:shoexsmass/widgets/ssmpaydata.dart';
import 'package:shoexsmass/widgets/topupitem.dart';

class TopUpPage extends StatefulWidget {
  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  var selectedPrice = 0;

  @override
  Widget build(BuildContext context) {
    Widget headBg() {
      return Container(
        height: 125,
        decoration: BoxDecoration(
            color: orange1,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12))),
      );
    }

    Widget headContent() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonCustom(
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "SsmPay Top Up",
                    style: poppinsText.copyWith(
                        fontSize: 14, fontWeight: semiBold, color: white),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
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
                        name: state.user.fullName,
                        phoneNumber: state.user.phoneNumber.toString(),
                      );
                    }
                    return Container();
                  },
                ))
          ],
        ),
      );
    }

    Widget header() {
      return Container(
          child: Stack(
        children: [headBg(), headContent()],
      ));
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 257),
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 1,
              color: line,
              margin: EdgeInsets.only(bottom: 16),
            ),
            Text(
              "Fast Top Up :",
              style: poppinsText.copyWith(
                  fontSize: 14, fontWeight: semiBold, color: orange1),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopUpItem(
                  price: 50000,
                  onPress: () {
                    if (selectedPrice == 50000) {
                      this.setState(() {
                        selectedPrice = 0;
                      });
                    } else {
                      this.setState(() {
                        selectedPrice = 50000;
                      });
                    }
                  },
                  active: selectedPrice == 50000,
                ),
                TopUpItem(
                  price: 100000,
                  onPress: () {
                    if (selectedPrice == 100000) {
                      this.setState(() {
                        selectedPrice = 0;
                      });
                    } else {
                      this.setState(() {
                        selectedPrice = 100000;
                      });
                    }
                  },
                  active: selectedPrice == 100000,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopUpItem(
                  price: 200000,
                  onPress: () {
                    if (selectedPrice == 200000) {
                      this.setState(() {
                        selectedPrice = 0;
                      });
                    } else {
                      this.setState(() {
                        selectedPrice = 200000;
                      });
                    }
                  },
                  active: selectedPrice == 200000,
                ),
                TopUpItem(
                  price: 300000,
                  onPress: () {
                    if (selectedPrice == 300000) {
                      this.setState(() {
                        selectedPrice = 0;
                      });
                    } else {
                      this.setState(() {
                        selectedPrice = 300000;
                      });
                    }
                  },
                  active: selectedPrice == 300000,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopUpItem(
                  price: 500000,
                  onPress: () {
                    if (selectedPrice == 500000) {
                      this.setState(() {
                        selectedPrice = 0;
                      });
                    } else {
                      this.setState(() {
                        selectedPrice = 500000;
                      });
                    }
                  },
                  active: selectedPrice == 500000,
                ),
                TopUpItem(
                  price: 1000000,
                  onPress: () {
                    if (selectedPrice == 1000000) {
                      this.setState(() {
                        selectedPrice = 0;
                      });
                    } else {
                      this.setState(() {
                        selectedPrice = 1000000;
                      });
                    }
                  },
                  active: selectedPrice == 1000000,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Manual Amount :",
              style: poppinsText.copyWith(
                  fontSize: 14, fontWeight: semiBold, color: orange1),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Text(
                  "IDR. ",
                  style: poppinsText.copyWith(
                      fontSize: 24, fontWeight: semiBold, color: black),
                ),
                Flexible(
                  child: TextFormField(
                    style: poppinsText.copyWith(
                        fontSize: 24, fontWeight: semiBold, color: black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration.collapsed(
                      hintText: "0",
                      hintStyle: poppinsText.copyWith(
                          fontSize: 24, fontWeight: semiBold, color: black),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget bottomButton() {
      return Container(
        margin: EdgeInsets.only(top: 698),
        height: 114,
        child: Column(
          children: [
            Container(
              height: 1,
              color: line,
            ),
            Container(
              margin: EdgeInsets.only(top: 32, left: 24, right: 24),
              child: CustomButton(
                title: "Continue",
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TopUpSummary(selectedPrice)));
                },
                disable: selectedPrice == 0,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [header(), content(), bottomButton()],
          ),
        ),
      ),
    );
  }
}
