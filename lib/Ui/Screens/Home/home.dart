import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magiccoffee/Controller/coffee_list_controller.dart';
import 'package:magiccoffee/Ui/Constans/app.dart';
import 'package:magiccoffee/Ui/Constans/icons.dart';
import 'package:magiccoffee/Ui/Constans/strings.dart';
import 'package:magiccoffee/Ui/Screens/Home/Cart.dart';
import 'package:magiccoffee/Ui/Screens/MyOrders/MyOrders.dart';
import 'package:magiccoffee/Ui/Screens/Profile/Profile.dart';
import 'package:magiccoffee/model/coffe_list_model.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static int _selectedTabIndex = 0;
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var Pages = [HomePage(), MyOrder(), Profile()];
  static int _selectedTabIndex = 0;
  _changeIndex(int index) {
    setState(() {
      HomeScreen._selectedTabIndex = index;
      print("index..." + index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        bottom: true,
        top: false,
        child: WillPopScope(
            child: Scaffold(
              backgroundColor: AppColors().ScaffoldBackgroundColor,
              body: Stack(
                children: [
                  Container(
                    child: Pages[HomeScreen._selectedTabIndex],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                        bottom: height * 0.01,
                      ),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors().WhiteColor,
                            border: Border.all(
                              color: AppColors().AppMainColor,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors().AppMainColor,
                              ),
                              BoxShadow(
                                color: AppColors().SubBottomBarColor,
                              ),
                              BoxShadow(
                                color: AppColors().WhiteColor,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BottomNavigationBar(
                              showSelectedLabels: false,
                              showUnselectedLabels: false,
                              selectedItemColor: AppColors().AppMainColor,
                              unselectedItemColor: AppColors().SubTextColor,
                              currentIndex: HomeScreen._selectedTabIndex,
                              onTap: _changeIndex,
                              enableFeedback: false,
                              type: BottomNavigationBarType.fixed,
                              items: [
                                BottomNavigationBarItem(
                                  icon: SvgPicture.asset(
                                    IconsData().HomeIcon,
                                    height: HomeScreen._selectedTabIndex == 0
                                        ? height * 0.04
                                        : height * 0.03,
                                    color: HomeScreen._selectedTabIndex == 0
                                        ? AppColors().AppMainColor
                                        : AppColors().SubBottomBarColor,
                                  ),
                                  label: "Home",
                                ),
                                BottomNavigationBarItem(
                                  icon: SvgPicture.asset(
                                    IconsData().BillIcon,
                                    height: HomeScreen._selectedTabIndex == 1
                                        ? height * 0.04
                                        : height * 0.03,
                                    color: HomeScreen._selectedTabIndex == 1
                                        ? AppColors().AppMainColor
                                        : AppColors().SubBottomBarColor,
                                  ),
                                  label: "",
                                ),
                                BottomNavigationBarItem(
                                  icon: SvgPicture.asset(
                                    IconsData().ProfileIcon,
                                    height: HomeScreen._selectedTabIndex == 2
                                        ? height * 0.04
                                        : height * 0.03,
                                    color: HomeScreen._selectedTabIndex == 2
                                        ? AppColors().AppMainColor
                                        : AppColors().SubBottomBarColor,
                                  ),
                                  label: "",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onWillPop: _onWillop));
  }

  Future<bool> _onWillop() {
    if (HomeScreen._selectedTabIndex != 0) {
      setState(() {
        HomeScreen._selectedTabIndex = 0;
      });
    } else {
      exit(0);
    }
    return Future.value(false);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CoffeeListModel coffeeListModel = CoffeeListModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  List<CoffeeListModel> coffeeListData = [];
  getData() async {
    CoffeList provider = Provider.of<CoffeList>(
      context,
      listen: false,
    );
    coffeeListData = await provider.getListData(context);

    print(coffeeListData[0].title);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // provider.getListData(context).then((value) {
    //   coffeeListModel = value;
    // });
    // print(coffeeListModel.title);
    return Scaffold(
      backgroundColor: AppColors().ScaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                top: height * 0.06,
                left: width * 0.05,
                right: width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsData().Walcome,
                        style: AppData().regulterTextStyle(
                          FontSize: 18,
                          FontColor: AppColors().SubTextColor,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(
                        StringsData().Alex,
                        style: AppData().regulterTextStyle(
                          FontSize: 18,
                          FontColor: AppColors().AppMainColor,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: const Duration(milliseconds: 200),
                              child: const CartPage(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          IconsData().BuyIcon,
                          height: height * 0.035,
                          fit: BoxFit.cover,
                        ),
                      )

                      // SizedBox(
                      //   width: width * 0.03,
                      // ),
                      // SvgPicture.asset(
                      //   IconsData().ProfileIcon,
                      //   height: height * 0.035,
                      //   fit: BoxFit.cover,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: height * 0.8,
            width: width,
            decoration: BoxDecoration(
              color: AppColors().AppMainColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: height * 0.03,
                left: width * 0.05,
                right: width * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringsData().SelectYourCoffee,
                    style: AppData().regulterTextStyle(
                      FontSize: 18,
                      FontColor: AppColors().WhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  // Expanded(
                  //   child:
                  Container(
                    height: height * 0.6,
                    width: width,
                    // color: Colors.white,
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          // childAspectRatio: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                        ),
                        padding: EdgeInsets.only(bottom: height * 0.2),
                        itemCount: coffeeListData.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                color: AppColors().WhiteColor,
                                // color: Colors.amber,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                coffeeListData[index].image!.split('.').last !=
                                        "gif"
                                    ? Container(
                                        height: height * 0.13,
                                        width: width,
                                        child: Image.network(
                                          coffeeListData[index].image ?? "",
                                          // 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Latte_at_Doppio_Ristretto_Chiang_Mai_01.jpg/509px-Latte_at_Doppio_Ristretto_Chiang_Mai_01.jpg'
                                          // 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/640px-A_small_cup_of_coffee.JPG',
                                        ),
                                      )
                                    : Container(
                                        height: height * 0.13,
                                        width: width,
                                        child: Center(
                                          child: Text("No image"),
                                        ),
                                      ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(coffeeListData[index].title.toString())
                              ],
                            ),
                          );
                        }),
                  ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
