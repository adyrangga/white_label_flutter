import 'package:flutter/material.dart';
import 'package:white_label_flutter/constants/strings.dart';
import 'package:white_label_flutter/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.dashboard,
      routes: Routes.routes,
    );
  }
}
