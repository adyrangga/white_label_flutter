import 'package:flutter/material.dart';
import 'package:white_label_flutter/src/utils/appRoutes.dart';
import 'package:white_label_flutter/src/utils/constans.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesPath.dashboardPath,
      routes: appRoutes,
      // home: DashboardScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
