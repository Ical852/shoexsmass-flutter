import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoexsmass/pages/explore.dart';
import 'package:shoexsmass/pages/home.dart';
import 'package:shoexsmass/pages/profile.dart';
import 'package:shoexsmass/pages/wish.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/menuitem.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var current = "home";

  @override
  Widget build(BuildContext context) {
    Widget bottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 71,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.9),
                blurRadius: 9,
                offset: Offset(0, 9))
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuItem(
                icon: "home",
                title: "Home",
                active: current == 'home',
                onPress: (){
                  this.setState(() {
                    current = 'home';
                  });
                },
              ),
              MenuItem(
                icon: "explore",
                title: "Explore",
                active: current == 'explore',
                onPress: (){
                  this.setState(() {
                    current = 'explore';
                  });
                },
              ),
              MenuItem(
                icon: "wish",
                title: "Wish",
                active: current == 'wish',
                onPress: (){
                  this.setState(() {
                    current = 'wish';
                  });
                },
              ),
              MenuItem(
                icon: "profile",
                title: "Profile",
                active: current == 'profile',
                onPress: (){
                  this.setState(() {
                    current = 'profile';
                  });
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return current == 'home' ? HomePage() 
      : current == 'explore' ? ExplorePage() 
      : current == 'wish' ? WishPage() : ProfilePage();
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            content(),
            bottomNav()
          ],
        ),
      ),
    );
  }
}