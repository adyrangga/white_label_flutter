import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:white_label_flutter/src/screens/dashboard/dashboard.dart';
import 'package:white_label_flutter/src/screens/register/register.dart';

/// route path
class RoutesPath {
  static const dashboardPath = '/';
  static const loginPath = '/login';
  static const registerPath = '/register';
}

/// route screen
var appRoutes = <String, WidgetBuilder>{
  RoutesPath.dashboardPath: (context) => DashboardScreen(),
  RoutesPath.registerPath: (context) => RegisterScreen(),
};
