import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:white_label_flutter/screens/cart/cart.dart';
import 'package:white_label_flutter/screens/dashboard/dashboard.dart';
import 'package:white_label_flutter/screens/login/login.dart';
import 'package:white_label_flutter/screens/profile/profile.dart';
import 'package:white_label_flutter/screens/register/register.dart';

class Routes {
  /// avoid instantiate class
  Routes._();

  /// static variables
  static const String SPLASH = '/splash';
  static const String REGISTER = '/register';
  static const String LOGIN = '/login';
  static const String DASHBOARD = '/dashboard';
  static const String PROFILE = '/profile';
  static const String CART = '/cart';

  /// routes screen
  static final routes = <String, WidgetBuilder>{
    DASHBOARD: (BuildContext context) => DashboardScreen(),
    REGISTER: (BuildContext context) => RegisterScreen(),
    LOGIN: (BuildContext context) => LoginScreen(),
    PROFILE: (BuildContext context) => ProfileScreen(),
    CART: (BuildContext context) => CartScreen(),
  };
}
