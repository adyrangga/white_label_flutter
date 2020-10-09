import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:white_label_flutter/app_state/app_state.dart';
import 'package:white_label_flutter/app_state/cart_state.dart';
import 'package:white_label_flutter/constants/strings.dart';
import 'package:white_label_flutter/routes.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => CartState()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.DASHBOARD,
      routes: Routes.routes,
    );
  }
}
