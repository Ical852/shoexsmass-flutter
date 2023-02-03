import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/cart_cubit.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/models/cartmodel.dart';
import 'package:shoexsmass/services/transactionservice.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/addressitem.dart';
import 'package:shoexsmass/widgets/checkoutitem.dart';
import 'package:shoexsmass/widgets/custombutton.dart';
import 'package:shoexsmass/widgets/headercustom.dart';
import 'package:shoexsmass/widgets/paymentsum.dart';
import 'package:shoexsmass/widgets/paymethod.dart';
import 'package:shoexsmass/widgets/ssmpaydata.dart';
import 'package:shoexsmass/widgets/toggle.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutPage extends StatefulWidget {
  List<CartModel> carts;
  CheckoutPage(this.carts);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var currenToggle = "left";
  var disable = false;
  var total = 0;
  var totalQty = 0;
  var loading = false;
  var paymentUrl = '';

  @override
  void initState() {
    super.initState();
    var curTotal = 0;
    widget.carts.forEach((element) {
      curTotal += element.product.price * element.qty;
      totalQty += element.qty;
    });
    this.setState(() {
      total = curTotal;
    });
  }

  void onCheckoutMidtrans() async {
    this.setState(() {
      loading = true;
    });
    showGLobalAlert('success', 'Checkout Berhasil', context);
    var order_id = Random().nextInt(10000).toString() + Random().nextInt(1000).toString();
    var userState = BlocProvider.of<UserCubit>(context).state;
    if (userState is UserFetchingSuccess) {
      List<Map<String, int>> tdDetails = [];
      widget.carts.map((e) => 
        tdDetails.add({
          'product_id': e.product.id,
          'qty': e.qty
        })
      );
      var response = await TransactionService().createTransaction(
        userId: userState.user.id,
        orderId: order_id,
        grossAmount: total + (total * 10) ~/ 100,
        payMethod: 'midtrans',
        tdDetail: tdDetails
      );
      this.setState(() {
        loading = false;
      });
      this.setState(() {
        paymentUrl = response.paymentUrl;
      });
    }
    this.setState(() {
      loading = false;
    });
  }

  void onCheckoutSSMPay() async {
    this.setState(() {
      loading = true;
    });
    showGLobalAlert('success', 'Checkout Berhasil', context);
    var order_id = Random().nextInt(10000).toString() + Random().nextInt(1000).toString();
    var userState = BlocProvider.of<UserCubit>(context).state;
    if (userState is UserFetchingSuccess) {
      List<Map<String, int>> tdDetails = [];
      widget.carts.map((e) => 
        tdDetails.add({
          'product_id': e.product.id,
          'qty': e.qty
        })
      );
      var response = await TransactionService().createTransaction(
        userId: userState.user.id,
        orderId: order_id,
        grossAmount: total + (total * 10) ~/ 100,
        payMethod: 'ssmPay',
        tdDetail: tdDetails
      );
    }
    this.setState(() {
      loading = false;
    });
    context.read<CartCubit>().resetCart();
    Timer(Duration(seconds: 1), () {
      Navigator.pushNamed(context, "/checkout-success");
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget listItems() {
      return Container(
        padding: EdgeInsets.only(top: 30, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "List Items",
              style: poppinsText.copyWith(
                  fontSize: 16, fontWeight: regular, color: black),
            ),
            SizedBox(
              height: 12,
            ),
            Column(
              children: widget.carts
                  .map(
                    (data) => CheckoutItem(
                      img: data.product.productImage[0].image,
                      name: data.product.name,
                      price: data.product.price * data.qty,
                      total: data.qty,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    }

    Widget addressArea() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserFetching) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserFetchingSuccess) {
            return Container(
              padding: EdgeInsets.only(top: 18, left: 24, right: 24),
              child: AddressItem(
                address: state.user.address,
                store: "Shoes Castle",
              ),
            );
          }
          return Container();
        },
      );
    }

    Widget paymentSumArea() {
      return Container(
        padding: EdgeInsets.only(top: 30, left: 24, right: 24),
        child: PaymentSum(
          phoneNumber: "$totalQty Items",
          topUp: "IDR. " + formatter(total),
          tax: "IDR. " + formatter((total * 10) ~/ 100),
          total: "IDR. " + formatter(total + (total * 10) ~/ 100),
          first: "Product Quantity",
          sec: "Product Price",
          last: "Tax & Shipping",
        ),
      );
    }

    Widget toggleArea() {
      return Container(
        padding: EdgeInsets.only(top: 30, left: 24, right: 24),
        child: ToggleCustom(
          current: currenToggle,
          leftPress: () {
            this.setState(() {
              currenToggle = 'left';
            });
          },
          rightPress: () {
            this.setState(() {
              currenToggle = 'right';
            });
          },
        ),
      );
    }

    Widget ssmpay() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserFetching) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserFetchingSuccess) {
            return Container(
              padding: EdgeInsets.only(top: 30, left: 24, right: 24),
              child: SsmPayData(
                balance: state.user.balance,
                minus: total + (total * 10) ~/ 100,
                disable: total > state.user.balance,
                name: state.user.fullName,
                phoneNumber: state.user.phoneNumber.toString(),
              ),
            );
          }
          return Container();
        },
      );
    }

    Widget midtrans() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 24, right: 24),
        child: PayMethod(),
      );
    }

    Widget renderPayment() {
      return currenToggle == 'left' ? ssmpay() : midtrans();
    }

    Widget checkoutButton() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserFetching) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserFetchingSuccess) {
            return Container(
              padding: EdgeInsets.only(top: 30, left: 24, right: 24),
              child: loading ? 
                Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                title: "Checkout Now",
                onPress: () {
                  currenToggle == 'left' ? onCheckoutSSMPay() : onCheckoutMidtrans();
                },
                disable: total > state.user.balance && currenToggle == 'left',
              ),
            );
          }
          return Container();
        },
      );
    }

    return paymentUrl != '' ? 
      Scaffold(
        appBar: AppBar(
          title: Text("Midtrans Payment"),
          backgroundColor: orange1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: (){
              this.setState(() {
                paymentUrl = "";
              });
              context.read<CartCubit>().resetCart();
              Timer(Duration(seconds: 1), () {
                Navigator.pushNamed(context, "/checkout-success");
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
        child: ListView(
          children: [
            HeaderCustom(
            title: "Checkout Details",
            onPress: () {
              Navigator.pop(context);
            }),
            listItems(),
            addressArea(),
            paymentSumArea(),
            toggleArea(),
            renderPayment(),
            checkoutButton(),
            SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}
