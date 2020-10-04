import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:white_label_flutter/screens/dashboard/dashboard.dart';
import 'package:white_label_flutter/screens/login/login.dart';
import 'package:white_label_flutter/screens/profile/profile.dart';
import 'package:white_label_flutter/screens/register/register.dart';

class Routes {
  Routes._();

  /// static variables
  static const String splash = '/splash';
  static const String register = '/register';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    dashboard: (BuildContext context) => DashboardScreen(),
    register: (BuildContext context) => RegisterScreen(),
    login: (BuildContext context) => LoginScreen(),
    profile: (BuildContext context) => ProfileScreen(),
  };
}
