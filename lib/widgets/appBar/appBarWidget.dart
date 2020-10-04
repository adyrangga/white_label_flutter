import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:white_label_flutter/routes.dart';

class AppBarWidget extends PreferredSize {

  final Widget child;
  final double height;
  final Color color;
  final String usageFor;
  final Function onClick;

  AppBarWidget({
    this.usageFor,
    this.child,
    this.color,
    this.height = kToolbarHeight,
    this.onClick,
  });

  Widget _rightSideContent(BuildContext context) {
    List<Widget> contents = [];
    if (usageFor == Routes.dashboard) {
      contents.add(IconButton(
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.center,
        icon: Icon(Icons.account_circle),
        color: Colors.black54,
        onPressed: () {
          onClick('profile');
        },
        // onPressed: () {
        //   Navigator.pushNamed(context, Routes.login);
        // },
      ));
    } else if (usageFor == Routes.login) {
      contents.add(IconButton(
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.centerRight,
        icon: Icon(Icons.account_circle),
        color: Colors.black54,
        onPressed: () {
          Navigator.pushNamed(context, Routes.register);
        },
      ));
      contents.add(IconButton(
        alignment: Alignment.centerRight,
        icon: Icon(Icons.shopping_cart),
        color: Colors.black54,
        onPressed: () {},
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: contents,
    );
  }

  Widget _leftSideContent(BuildContext context) {
    List<Widget> contents = [
      IconButton(
        alignment: Alignment.center,
        icon: Icon(Icons.menu),
        color: Colors.black,
        onPressed: () {},
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      )
    ];
    if (usageFor == Routes.login) {
      contents.add(IconButton(
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.centerLeft,
        icon: Icon(Icons.pin_drop),
        color: Colors.black54,
        onPressed: () {},
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: contents,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    print('appBarWidget $usageFor}');
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.33,
              alignment: Alignment.centerLeft,
              child: _leftSideContent(context),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.34,
                alignment: Alignment.centerRight,
                child: Image(
                    image: AssetImage('assets/images/primary-logo.png'),
                    width: 150,
                    height: 50)),
            Container(
              width: MediaQuery.of(context).size.width * 0.33,
              alignment: Alignment.centerRight,
              child: _rightSideContent(context),
            ),
          ],
        ),
      ),
    );
  }
}
