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

  Widget loginRightIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          padding: EdgeInsets.all(0.0),
          alignment: Alignment.centerRight,
          icon: Icon(Icons.account_circle),
          color: Colors.black54,
          onPressed: () {
            Navigator.pushNamed(context, RoutesPath.registerPath);
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

  /// decide the usages of head bar
  Widget rightContent(BuildContext context) {
    var content;
    if (usageFor == RoutesPath.loginPath) {
      content = loginRightIcon(context);
      return content;
    }
    return null;
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
              child: IconButton(
                alignment: Alignment.center,
                icon: Icon(Icons.menu),
                color: Colors.black,
                onPressed: () {},
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
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
              child: rightContent(context),
            ),
          ],
        ),
      ),
    );
  }
}
