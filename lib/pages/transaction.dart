import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/models/transactionmodel.dart';
import 'package:shoexsmass/services/transactionservice.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/headercustom.dart';
import 'package:shoexsmass/widgets/mainitem.dart';
import 'package:shoexsmass/widgets/minibutton.dart';

class TransactionPage extends StatefulWidget {
  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  var empty = true;
  List<TransactionModel> transactions = [];

  void getTransactions() async {
    var userState = BlocProvider.of<UserCubit>(context).state;
    if (userState is UserFetchingSuccess) {
      var response = await TransactionService().getByUserId(
        userId: userState.user.id
      );

      if (response.length > 0) {
        this.setState(() {
          empty = false;
        });
      } else {
        return this.setState(() {
          transactions = [];
        });
      }

      this.setState(() {
        transactions = response;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    Widget emptyTrx() {
      return Container(
        margin: EdgeInsets.only(
          top: 100
        ),
        child: Column(
          children: [
            Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/illustrations/ilemptytrx.png")
                  )
                ),
              ),
              Text(
                "No Transactions Yet",
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
                width: 250,
                child: Text(
                  "Seems like you have not purchased any shoes or top up yet",
                  style: poppinsText.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                    color: grey
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30,),
              MiniButton(title: "Go to Home", onPress: (){
                Navigator.pushNamed(context, "/main");
              })
          ],
        ),
      );
    }  

    Widget trxExist() {
      return Container(
        padding: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 16
              ),
              child: Text(
                "All of your Transactions",
                style: poppinsText.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
            ),
            Column(
              children: transactions.map((trx) => 
                Column(
                  children: trx.transactionDetail.map((e) => 
                    MainItem(
                      img: e.product.productImage[0].image,
                      name: e.product.name,
                      desc: e.product.desc,
                      price: e.product.price * e.qty,
                      cat: e.product.category.name,
                      onPress: () {},
                      type: "cart",
                      trx: true,
                      totalItem: e.qty,
                    ),
                  ).toList(),
                )
              ).toList(),
            ),
          ],
        ),
      );
    }

    Widget renderContent() {
      return empty ? emptyTrx() : trxExist();
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            HeaderCustom(title: "Transcations", onPress: (){
              Navigator.pop(context);
            }),
            renderContent()
          ],
        ),
      ),
    );
  }
}