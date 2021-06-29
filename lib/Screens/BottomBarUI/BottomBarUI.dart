import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity_basket_app_dev/Components/Toast/ShowToast.dart';
import 'package:infinity_basket_app_dev/Routes/MarketPlaceNavigator.dart';
import 'package:infinity_basket_app_dev/Routes/MyCartNavigator.dart';
import 'package:infinity_basket_app_dev/Routes/OrdersNavigator.dart';
import 'package:infinity_basket_app_dev/Routes/UserAccountNavigator.dart';
import 'package:infinity_basket_app_dev/Utils/Constants/ColorConstants.dart';

class BottomBarUI extends StatefulWidget {
  @override
  _BottomBarUIState createState() => _BottomBarUIState();
}

class _BottomBarUIState extends State<BottomBarUI>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  TabController controller;
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];
  DateTime currentBackPressTime;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4, initialIndex: 2);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (_navigatorKeys[controller.index].currentState.canPop()) {
      _navigatorKeys[controller.index]
          .currentState
          .pop(_navigatorKeys[controller.index].currentContext);
      return Future.value(false);
    } else {
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        showToast("Double Tap To Exit");
        return Future.value(false);
      }
    }
    SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: TabBarView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            MyCartNavigator(_navigatorKeys[0]),
            OrdersNavigator(_navigatorKeys[1]),
            MarketPlaceNavigator(_navigatorKeys[2]),
            UserAccountNavigator(_navigatorKeys[4]),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: BottomAppBar(
            color: ColorConstants.secondaryColor,
            shape: CircularNotchedRectangle(),
            child: TabBar(
              controller: controller,
              onTap: (index) {
                if (_navigatorKeys[controller.index].currentState != null) {
                  _navigatorKeys[controller.index]
                      .currentState
                      .popUntil((r) => r.isFirst);
                }
                /* switch (index) {
                  case 2:
                    _navigatorKeys[2]
                        .currentState
                        .popUntil((r) => r.isFirst);
                    break;
                }*/
              },
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.transparent, width: 3),
                ),
              ),
              tabs: [
                buildTab('cart.png', "Wallet", 1),
                buildTab('view_order_icon.png', 'Orders', 2),
                buildTab('market_place.png', 'Marketplace', 3),
                buildTab('account.png', 'Account', 4),
              ],
              labelPadding: EdgeInsets.all(0.0),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 15.0),
              labelColor: Theme.of(context).accentColor,
              unselectedLabelColor: Theme.of(context).accentColor,
              unselectedLabelStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w500),
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
      ),
      onWillPop: onWillPop,
    );
  }

  Container buildTab(String imgPath, String label, int index) {
    return Container(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // index == 1
          //     ? Consumer<AddToCartProvider>(
          //         builder: (_, cart, child) => Badge(
          //           badgeContent: Text(
          //             cart.totalCarts.toString(),
          //             style: TextStyle(color: ColorConstants.primaryColor),
          //           ),
          //           child: Image.asset(
          //             'assets/images/' + imgPath,
          //             height: 28,
          //             width: 28,
          //             color: ColorConstants.primaryColor,
          //           ),
          //           animationType: BadgeAnimationType.scale,
          //           badgeColor:
          //               ColorConstants.appBarNotificationCircleYellowColor,
          //           showBadge: cart.totalCarts == 0 ? false : true,
          //         ),
          //       )
          //     :
          Image.asset(
            'assets/images/' + imgPath,
            width: 25,
            height: 25,
            color: ColorConstants.primaryColor,
          ),
          Text(label),
        ],
      ),
    );
  }
}
