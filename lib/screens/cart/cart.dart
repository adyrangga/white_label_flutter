import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:white_label_flutter/constants/size.dart';
import 'package:white_label_flutter/constants/strings.dart';
import 'package:white_label_flutter/routes.dart';
import 'package:white_label_flutter/widgets/app_bar/app_bar_widget.dart';
import 'package:white_label_flutter/widgets/button/button_widget.dart';
import 'package:white_label_flutter/widgets/safe_area/save_area_widget.dart';
import 'package:white_label_flutter/widgets/search_bar/search_bar_widget.dart';
import 'package:white_label_flutter/widgets/text/text_clickable_widget.dart';
import 'package:white_label_flutter/widgets/text/text_widget.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

Widget _cartEmpty(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(0.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextWidget(
          text: Strings.CART_EMPTY,
          fontSize: Size.TITLE,
          fontWeight: FontWeight.bold,
        ),
        TextClickableWidget(
            text: Strings.BACK_TO_SHOPPING,
            margin: EdgeInsets.symmetric(vertical: 10),
            onClick: () {
              print('click back to shopping');
            }),
        Container(
          margin: EdgeInsets.all(20),
          child: Image(
            image: AssetImage('assets/icons/cart-red.png'),
            width: 60,
            height: 60,
          ),
        )
      ],
    ),
  );
}

Widget _cartHasContents(BuildContext context) {
  return SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBarWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextWidget(
                text: Strings.MY_SHOPPING_CART,
                fontSize: Size.TITLE,
                fontWeight: FontWeight.bold,
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                alignment: Alignment.center,
                child: Text(
                  "1",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Size.SUB_TITLE,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              ButtonWidget(text: Strings.TAKE_ME_TO_CHECKOUT),
            ],
          ),
        ],
      ),
    ),
  );
}

class _CartScreenState extends State<CartScreen> {
  var cartItems = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        usageFor: Routes.cart,
        // onClick: _handleClickAppBar,
      ),
      body: SafeAreaWidget(
        child: cartItems > 0 ? _cartHasContents(context) : _cartEmpty(context),
      ),
    );
  }
}
