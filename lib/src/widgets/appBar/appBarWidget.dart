import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:white_label_flutter/src/utils/appRoutes.dart';

class AppBarWidget extends PreferredSize {
  final Widget child;
  final double height;
  final Color color;
  final String usageFor;

  AppBarWidget({
    this.usageFor,
    this.child,
    this.color,
    this.height = kToolbarHeight,
  });

  Widget rightSideContent(BuildContext context) {
    print(usageFor);
    if (usageFor == RoutesPath.dashboard) {
      return null;
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0.0),
            alignment: Alignment.centerRight,
            icon: Icon(Icons.account_circle),
            color: Colors.black54,
            onPressed: () {
              Navigator.pushNamed(context, RoutesPath.register);
            },
          ),
          IconButton(
            alignment: Alignment.centerRight,
            icon: Icon(Icons.shopping_cart),
            color: Colors.black54,
            onPressed: () {},
          ),
        ],
      );
    }
  }

  Widget leftSideContent(BuildContext context) {
    if (usageFor == RoutesPath.dashboard) {
      return IconButton(
        alignment: Alignment.center,
        icon: Icon(Icons.menu),
        color: Colors.black,
        onPressed: () {},
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0.0),
            alignment: Alignment.center,
            icon: Icon(Icons.menu),
            color: Colors.black54,
            onPressed: () {},
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
          IconButton(
            padding: EdgeInsets.all(0.0),
            alignment: Alignment.centerLeft,
            icon: Icon(Icons.pin_drop),
            color: Colors.black54,
            onPressed: () {},
          ),
        ],
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
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
              child: leftSideContent(context),
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
              child: rightSideContent(context),
            ),
          ],
        ),
      ),
    );
  }
}
