import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:white_label_flutter/src/utils/constans.dart';
import 'package:white_label_flutter/src/widgets/appBar/appBarWidget.dart';
import 'package:white_label_flutter/src/widgets/inputField/inputFieldWidget.dart';
import 'package:white_label_flutter/src/widgets/safeArea/saveAreaWidget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
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
                  child: Text(Constants.createAccountText,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                      Constants.registerInfo1Text,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                      Constants.registerInfo2Text,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                ),
                Form(child: Column(
                  children: <Widget>[
                    InputFieldWidget(
                      hintText: "First Name*",
                      obscureText: true,
                      textInputType: TextInputType.text,
                      functionValidate: commonValidation,
                    ),
                    InputFieldWidget(
                      hintText: "Last Name*",
                      obscureText: true,
                      textInputType: TextInputType.text,
                      functionValidate: commonValidation,
                    ),
                    InputFieldWidget(
                      hintText: "Email address**",
                      obscureText: true,
                      textInputType: TextInputType.emailAddress,
                      functionValidate: commonValidation,
                    ),
                  ],
                ))
              ],
            ),
          )
        ),
      ),
    );
  }
}

