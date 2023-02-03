import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/models/productmodel.dart';
import 'package:shoexsmass/pages/detail.dart';
import 'package:shoexsmass/services/productservice.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/bigitem.dart';
import 'package:shoexsmass/widgets/catitem.dart';
import 'package:shoexsmass/widgets/mainitem.dart';
import 'package:shoexsmass/widgets/miditem.dart';
import 'package:shoexsmass/widgets/ssmpay.dart';
import 'package:shoexsmass/widgets/tinyitem.dart';
import 'package:shoexsmass/widgets/titledesc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentCat = 'all';
  List<ProductModel> data1 = [];
  List<ProductModel> data2 = [];
  List<ProductModel> data3 = [];
  List<ProductModel> def = [];
  var loading1 = false;
  var loading2 = false;
  var loading3 = false;

  void getBestSeller() async {
    this.setState(() {
      loading1 = true;
    });
    List<ProductModel> response = await ProductService().getByCategoryId(catId: 1);
    this.setState(() {
      data1 = response;
    });
    this.setState(() {
      loading1 = false;
    });
  }

  void getPopularShoes() async {
    this.setState(() {
      loading2 = true;
    });
    List<ProductModel> response = await ProductService().getByCategoryId(catId: 2);
    this.setState(() {
      data2 = response;
    });
    this.setState(() {
      loading2 = false;
    });
  }

  void getAll() async {
    this.setState(() {
      loading3 = true;
    });
    List<ProductModel> response = await ProductService().getAll();
    this.setState(() {
      data3 = response;
      def = response;
    });
    this.setState(() {
      loading3 = false;
    });
  }

  @override
  void initState() {
    super.initState();
    var state = BlocProvider.of<UserCubit>(context).state;
    if (state is UserSigningInSuccess) {
      context.read<UserCubit>().fetch(userId: state.user.id);
    }
    if (state is UserSigningUpSuccess) {
      context.read<UserCubit>().fetch(userId: state.user.id);
    }
    if (state is UserFetchingSuccess) {
      context.read<UserCubit>().fetch(userId: state.user.id);
    }
    if (state is UserUpdatingSuccess) {
      context.read<UserCubit>().fetch(userId: state.user.id);
    }
    getBestSeller();
    getPopularShoes();
    getAll();
  }

  @override
  Widget build(BuildContext context) {
    
    Widget header() {
      return Container(
        padding: EdgeInsets.only(top: 24, left: 24, right: 24),
        height: 194,
        decoration: BoxDecoration(
            color: orange1,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is UserFetchingSuccess) {
                      return Container(
                        width: 157,
                        child: Text(
                          "Hello, \n" + state.user.fullName,
                          style: poppinsText.copyWith(
                              fontSize: 24, fontWeight: semiBold, color: white),
                        ),
                      );
                    }
                    if (state is UserFetching) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container();
                  },
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(50)),
                  child: BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      if (state is UserFetchingSuccess) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(state.user.image)),
                              borderRadius: BorderRadius.circular(50)),
                        );
                      }
                      if (state is UserFetching) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Container();
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 40,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/icons/icsearch.png"))),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                          hintText: "Search your shoes here",
                          hintStyle: poppinsText.copyWith(
                              fontSize: 14, fontWeight: regular, color: grey)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget ssmpayArea() {
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserFetchingSuccess) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: SSMPay(
                balance: state.user.balance,
                onPress: () {
                  Navigator.pushNamed(context, "/top-up");
                },
              ));
          }
          if (state is UserFetching) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container();
        },
      );
    }

    Widget bestSellerArea() {
      return Container(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: loading1 ? 
          Container(
            width: MediaQuery.of(context).size.width,
            height: 205,
            margin: EdgeInsets.only(
              top: 16,
              bottom: 20
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ) : Row(
            children: [
              SizedBox(
                width: 24,
              ),
              Row(
                children: data1.map((data) => BigItem(
                  img: data.productImage[0].image, cat: data.category.name, name: data.name, price: data.price,
                  onPress: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => DetailPage(data)
                      )
                    );
                  },
                )).toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget superRareArea() {
      return Container(
        margin: EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          children: [
            Row(
              children: [
                TinyItem(
                  img: "assets/dummy/dummy4.png",
                  name: "Don Issue 2 Shoes",
                  price: 670000,
                  cat: "Hiking",
                ),
                SizedBox(
                  width: 16,
                ),
                TinyItem(
                  img: "assets/dummy/dummy5.png",
                  name: "Harden Vol 4 Shoes",
                  price: 720000,
                  cat: "Training",
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                TinyItem(
                  img: "assets/dummy/dummy6.png",
                  name: "Pro Boost Low Shoes",
                  price: 850000,
                  cat: "Training",
                ),
                SizedBox(
                  width: 16,
                ),
                TinyItem(
                  img: "assets/dummy/dummy7.png",
                  name: "Dame 7 Shoes",
                  price: 950000,
                  cat: "Hiking",
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget popularArea() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 24,
              ),
              loading2 ? Container(
                margin: EdgeInsets.only(right: 20, top: 16, bottom: 20),
                padding: EdgeInsets.all(20),
                height: 278,
              ) : Row(
                children: data2.map((data) => MidItem(
                  img: data.productImage[0].image, 
                  cat: data.category.name, 
                  name: data.name, 
                  price: data.price,
                  onPress: (){
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => DetailPage(data)
                      )
                    );
                  },
                )).toList(),
              ),
              SizedBox(
                width: 4,
              ),
            ],
          ),
        ),
      );
    }

    Widget categoryArea() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 24,
              ),
              CatItem(
                title: "All Shoes",
                onPress: () {
                  this.setState(() {
                    currentCat = 'all';
                  });
                  this.setState(() {
                    data3 = def;
                  });
                },
                active: currentCat == 'all',
              ),
              CatItem(
                title: "Running",
                onPress: () {
                  this.setState(() {
                    currentCat = 'running';
                  });
                  this.setState(() {
                    data3 = def;
                    data3 = data3.where((element) => element.category.id == 1).toList();
                  });
                },
                active: currentCat == 'running',
              ),
              CatItem(
                title: "Training",
                onPress: () {
                  this.setState(() {
                    currentCat = 'training';
                  });
                   this.setState(() {
                    data3 = def;
                    data3 = data3.where((element) => element.category.id == 2).toList();
                  });
                },
                active: currentCat == 'training',
              ),
              CatItem(
                title: "Basketball",
                onPress: () {
                  this.setState(() {
                    currentCat = 'basketball';
                  });
                   this.setState(() {
                    data3 = def;
                    data3 = data3.where((element) => element.category.id == 3).toList();
                  });
                },
                active: currentCat == 'basketball',
              ),
              CatItem(
                title: "Hiking",
                onPress: () {
                  this.setState(() {
                    currentCat = 'hiking';
                  });
                   this.setState(() {
                    data3 = def;
                    data3 = data3.where((element) => element.category.id == 4).toList();
                  });
                },
                active: currentCat == 'hiking',
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      );
    }

    Widget arrivalArea() {
      return Container(
        margin: EdgeInsets.only(top: 16, left: 24, right: 24),
        child: Column(
          children: [
            loading3 ? Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(16),
              height: 150,
            ) : Column(
              children: data3.map((data) => MainItem(
                img: data.productImage[0].image, 
                cat: data.category.name, 
                desc: data.desc, 
                name: data.name, 
                onPress: (){
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => DetailPage(data)
                    )
                  );
                }, 
                price: data.price))
              .toList(),
            ),
            Text(
              "Show all Shoes >>",
              style: poppinsText.copyWith(
                  fontSize: 10, fontWeight: semiBold, color: orange1),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ssmpayArea(),
            Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 24,
                ),
                child: TitleDesc(
                  title: "Best Seller Shoes",
                  subTitle: "Get best seller shoes right now !",
                )),
            bestSellerArea(),
            Container(
                margin: EdgeInsets.only(
                  left: 24,
                ),
                child: TitleDesc(
                  title: "Super Rare Shoes",
                  subTitle: "Get super rare shoes now before it’s too late !",
                )),
            superRareArea(),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(
                  left: 24,
                ),
                child: TitleDesc(
                  title: "Popular Shoes",
                  subTitle: "Get popular products right now !",
                )),
            popularArea(),
            categoryArea(),
            Container(
                margin: EdgeInsets.only(left: 24, top: 16),
                child: TitleDesc(
                  title: "New Arrivals",
                  subTitle: "Get new products right now !",
                )),
            arrivalArea(),
            SizedBox(
              height: 100,
            )
          ],
        ),
      );
    }

    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
