import 'package:flutter/material.dart';

/// navigation management
/// avoid duplicate route in same time
class Navigation {
  Navigation(this.context);

  final BuildContext context;

  void to(String nextRoute) {
    String currentRoute = ModalRoute.of(context).settings.name;
    bool isMatch = checkMatches(currentRoute, nextRoute);
    /// avoid duplicate route in same time
    if (isMatch) Navigator.pushReplacementNamed(context, nextRoute);
    /// move to nextRoute
    else Navigator.pushNamed(context, nextRoute);
  }

  bool checkMatches(String currentRoute, String nextRoute ) {
    if (currentRoute == nextRoute) return true;
    return false;
  }
}