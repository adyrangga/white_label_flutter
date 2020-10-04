import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:white_label_flutter/constants/size.dart';
import 'package:white_label_flutter/constants/strings.dart';
import 'package:white_label_flutter/models/accounts/accountsViewModel.dart';
import 'package:white_label_flutter/routes.dart';
import 'package:white_label_flutter/utils/validationForm.dart';
import 'package:white_label_flutter/widgets/appBar/appBarWidget.dart';
import 'package:white_label_flutter/widgets/button/buttonWidget.dart';
import 'package:white_label_flutter/widgets/fake/fake_widget.dart';
import 'package:white_label_flutter/widgets/inputField/inputFieldWidget.dart';
import 'package:white_label_flutter/widgets/safeArea/saveAreaWidget.dart';
import 'package:white_label_flutter/widgets/spinner/spinner_overlay.dart';
import 'package:white_label_flutter/widgets/text/textWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<LoginScreen> with ValidationForm {
  final formKey = GlobalKey<FormState>();

  /// instance SharedPreferences service
  Future<SharedPreferences> spService = SharedPreferences.getInstance();
  SharedPreferences sp;

  /// state variable
  String email = '';
  String password = '';
  bool showErrorLogin = false;

  @override
  void initState() {
    super.initState();
    instanceSP();
  }

  void instanceSP() async {
    sp = await spService;
  }

  void _loginButtonHandler(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        showErrorLogin = false;
      });
      _validateUserLogin();
    } else {
      setState(() {
        showErrorLogin = true;
      });
    }
  }

  void _validateUserLogin() async {
    showDialog(
      context: context,
      builder: (BuildContext context) => SpinnerOverlay(),
    );
    List result =
        await AccountsViewModel().getAccounts().then((value) => value);
    var check = result
        .where((item) => item.email == email && item.password == password)
        .toList();
    print('userLog > $email $password');
    if (check.length == 1) {
      print('login valid: $check');
      sp.setBool('hasLogin', true);
      Navigator.pushNamed(context, Routes.dashboard);
    } else {
      print('login not valid: $check');
      sp.setBool('hasLogin', false);
      setState(() {
        showErrorLogin = true;
      });
    }
    // Navigator.pop(context);
    Navigator.of(context).pop();
  }

  /// WIDGETS SECTION

  Widget _errorMessageWidget(BuildContext context) {
    if (showErrorLogin)
      return TextWidget(
        text: Strings.LOGIN_FAILED_MESSAGE,
        padding: EdgeInsets.symmetric(vertical: 20),
      );
    return FakeWidget();
  }

  Widget _textForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
          child: Text(Strings.forgotPasswordText,
              style: TextStyle(color: Colors.blue)),
        )
      ],
    );
  }

  /// return ui for new customer contents ui
  Widget _newCustomerWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 80, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextWidget(
            text: Strings.NEW_CUSTOMER,
            fontSize: Size.TITLE,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: Strings.NEW_CUSTOMER_INFO,
            fontWeight: FontWeight.w500,
          ),
          ButtonWidget(
            text: Strings.createAccountText,
            textColor: Colors.red,
            minWidth: 250,
            backgroundColor: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 30),
            onClick: () {
              Navigator.pushNamed(context, Routes.register);
            },
          ),
          TextWidget(
            text: Strings.BENEFITS_CREATING,
            fontSize: Size.SUB_TITLE,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: Strings.NEWS_AND_EXCLUSIVE_OFFERS,
            fontSize: Size.NORMAL,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: Strings.NEWS_AND_EXCLUSIVE_OFFERS_INFO,
            fontSize: Size.DEFAULT,
          ),
          TextWidget(
            text: Strings.ORDER_HISTORY,
            fontSize: Size.NORMAL,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: Strings.ORDER_HISTORY_INFO,
            fontSize: Size.DEFAULT,
          ),
          TextWidget(
            text: Strings.FASTER_CHECKOUT,
            fontSize: Size.NORMAL,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: Strings.FASTER_CHECKOUT_INFO,
            fontSize: Size.DEFAULT,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        usageFor: Routes.login,
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
                    child: Text(Strings.RETURNING_CUSTOMERS_TEXT,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(Strings.requiredText,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(Strings.loginInfoText,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                  _errorMessageWidget(context),
                  Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          InputFieldWidget(
                            hintText: Strings.emailHintText,
                            textInputType: TextInputType.emailAddress,
                            functionValidate: validateEmail,
                            onSaved: (String value) {
                              email = value;
                            },
                            onSubmitField: () {
                              FocusScope.of(context).nextFocus();
                            },
                          ),
                          InputFieldWidget(
                            obscureText: true,
                            hintText: Strings.passwordHintText,
                            textInputType: TextInputType.visiblePassword,
                            functionValidate: validatePassword,
                            onSaved: (String value) {
                              password = value;
                            },
                            onSubmitField: () {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          _textForgotPassword(),
                          ButtonWidget(
                            text: Strings.loginText,
                            minWidth: 250,
                            onClick: () {
                              _loginButtonHandler(context);
                            },
                          ),
                        ],
                      )),
                  _newCustomerWidget(context),
                ],
              ),
            )),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
