import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/profileitem.dart';
import 'package:shoexsmass/widgets/ssmpay.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    var state = BlocProvider.of<UserCubit>(context).state;
    if (state is UserFetchingSuccess) {
      context.read<UserCubit>().fetch(userId: state.user.id);
    }
    if (state is UserUpdatingSuccess) {
      context.read<UserCubit>().fetch(userId: state.user.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget topBg() {
      return Container(
        height: 220,
        decoration: BoxDecoration(
            color: orange1,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      );
    }

    Widget title() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/iccat.png"))),
          ),
          Text(
            "My Profile",
            style: poppinsText.copyWith(
                fontSize: 14, fontWeight: semiBold, color: white),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/notif");
            },
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/icnotifwhite.png"))),
            ),
          ),
        ],
      );
    }

    Widget profileContent() {
      return Container(
        margin: EdgeInsets.only(top: 26),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.all(3),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(50)),
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserFetching) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is UserFetchingSuccess) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(state.user.image)),
                          borderRadius: BorderRadius.circular(50)),
                    );
                  }
                  return Container();
                },
              ),
            ),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserFetching) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is UserFetchingSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.user.fullName,
                        style: poppinsText.copyWith(
                            fontSize: 16, fontWeight: semiBold, color: white),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        state.user.email,
                        style: poppinsText.copyWith(
                            fontSize: 14, fontWeight: regular, color: white),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        state.user.phoneNumber.toString(),
                        style: poppinsText.copyWith(
                            fontSize: 14, fontWeight: regular, color: white),
                      ),
                    ],
                  );
                }
                return Container();
              },
            )
          ],
        ),
      );
    }

    Widget topContent() {
      return Container(
        margin: EdgeInsets.only(top: 28, left: 24, right: 24),
        child: Column(
          children: [title(), profileContent()],
        ),
      );
    }

    Widget mainContent() {
      return Container(
        margin: EdgeInsets.only(left: 24, right: 24, top: 184),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserFetching) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is UserFetchingSuccess) {
                  return SSMPay(balance: state.user.balance, onPress: () {
                    Navigator.pushNamed(context, "/top-up");
                  },);
                }
                return Container();
              },
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Profile Settings",
              style: poppinsText.copyWith(
                  fontSize: 16, fontWeight: semiBold, color: black),
            ),
            SizedBox(
              height: 13,
            ),
            ProfileItem(
              title: "Edit Profile",
              desc: "Edit your profile account",
              img: "assets/icons/icpencil.png",
              onPress: () {
                Navigator.pushNamed(context, "/edit-profile");
              },
            ),
            ProfileItem(
              title: "My Carts",
              desc: "Check your carts here",
              img: "assets/icons/icshoporange.png",
              onPress: () {
                Navigator.pushNamed(context, "/cart");
              },
            ),
            ProfileItem(
              title: "My Transactions",
              desc: "Your Transactions History",
              img: "assets/icons/icdollar.png",
              onPress: () {
                Navigator.pushNamed(context, "/trx");
              },
            ),
            ProfileItem(
              title: "Help Center",
              desc: "Need more help",
              img: "assets/icons/ichelp.png",
              onPress: () {},
            ),
            ProfileItem(
              title: "Settings",
              desc: "Settings your account",
              img: "assets/icons/icsettings.png",
              onPress: () {},
            ),
            SizedBox(
              height: 120,
            )
          ],
        ),
      );
    }

    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: [topBg(), topContent(), mainContent()],
        ),
      ),
    );
  }
}
