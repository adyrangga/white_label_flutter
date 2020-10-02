import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:white_label_flutter/src/screens/dashboard/dashboard.dart';
import 'package:white_label_flutter/src/screens/register/register.dart';

/// route path
class RoutesPath {
  static const dashboard = '/';
  static const login = '/login';
  static const register = '/register';
}

/// route screen
var appRoutes = <String, WidgetBuilder>{
  RoutesPath.dashboard: (context) => DashboardScreen(),
  RoutesPath.register: (context) => RegisterScreen(),
};
