import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/headercustom.dart';
import 'package:shoexsmass/widgets/minibutton.dart';
import 'package:shoexsmass/widgets/notifitem.dart';

class NotifPage extends StatefulWidget {
  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    var empty = false;

    Widget notifExist() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 24,
                bottom: 16
              ),
              child: Text(
                "Account Info",
                style: poppinsText.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
            ),
            NotifItem(
              title: "Your account has been verified",
              desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
              date: "26 May",
            ),
            NotifItem(
              title: "You got SmmPay Bonus !!!",
              desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
              date: "21 May",
            ),
            NotifItem(
              title: "Get high discounts now !",
              desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
              date: "22 May",
            ),
            NotifItem(
              title: "New arrival, Check it out !!!",
              desc: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
              date: "23 May",
            ),
          ],
        ),
      );
    }

    Widget emptyNotif() {
      return Container(
        margin: EdgeInsets.only(
          top: 115
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/illustrations/ilemptynotif.png")
                  )
                ),
              ),
              Text(
                "No Notifications Yet",
                style: poppinsText.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 6
                ),
                width: 200,
                child: Text(
                  "Seems like there is no any notifications for you yet",
                  style: poppinsText.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                    color: grey
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30,),
              MiniButton(title: "Home", onPress: (){
                Navigator.pushNamed(context, "/main");
              })
            ],
          ),
        ),
      );
    }

    Widget content() {
      return empty ? emptyNotif() : notifExist();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              HeaderCustom(title: "Notifications", onPress: (){
                Navigator.pop(context);
              }),
              content()
            ],
          ),
        ),
      ),
    );
  }
}