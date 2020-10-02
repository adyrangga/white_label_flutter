import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:white_label_flutter/src/utils/appRoutes.dart';
import 'package:white_label_flutter/src/utils/constans.dart';
import 'package:white_label_flutter/src/widgets/appBar/appBarWidget.dart';
import 'package:white_label_flutter/src/widgets/inputField/inputFieldWidget.dart';
import 'package:white_label_flutter/src/widgets/safeArea/saveAreaWidget.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key, this.title = ''}) : super(key: key);
  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        usageFor: RoutesPath.dashboard,
      ),
      body: SafeAreaWidget(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(Constants.returningCustomersText,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(Constants.requiredText,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                        Constants.loginInfoText,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                  Form(child: Column(
                    children: <Widget>[
                      InputFieldWidget(
                        hintText: "Email address*",
                        obscureText: true,
                        textInputType: TextInputType.emailAddress,
                        functionValidate: commonValidation,
                      ),
                      InputFieldWidget(
                        hintText: "Password",
                        obscureText: true,
                        textInputType: TextInputType.visiblePassword,
                        functionValidate: commonValidation,
                      ),
                    ],
                  ))
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesPath.register);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
