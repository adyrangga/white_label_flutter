import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:white_label_flutter/constants/size.dart';
import 'package:white_label_flutter/constants/strings.dart';
import 'package:white_label_flutter/data/network/mock_urls.dart';
import 'package:white_label_flutter/view_models/products_view_model.dart';
import 'package:white_label_flutter/routes.dart';
import 'package:white_label_flutter/widgets/app_bar/app_bar_widget.dart';
import 'package:white_label_flutter/widgets/products_grid/products_grid_widget.dart';
import 'package:white_label_flutter/widgets/safe_area/save_area_widget.dart';
import 'package:white_label_flutter/widgets/search_bar/search_bar_widget.dart';
import 'package:white_label_flutter/widgets/spinner/spinner_overlay.dart';
import 'package:white_label_flutter/widgets/text/text_widget.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  /// instance SharedPreferences service
  Future<SharedPreferences> spService = SharedPreferences.getInstance();
  SharedPreferences sp;

  /// defines state variable
  List products = [];


  @override
  void initState() {
    super.initState();
    instanceSP();
  }

  void instanceSP() async {
    sp = await spService;
    List results = await ProductsViewModel().getProducts().then((value) => value);
    print('results products > $results');
    setState(() {
      products = results;
    });
  }

  void _handleClickAppBar(String key) {
    print('_handleClickAppBar > $key');
    var hasLogin = sp.getBool('hasLogin') ?? false;
    print('hasLogin > $hasLogin');
    if (key == 'profile') {
      if (hasLogin) {
        print('You Has been login in');
        Navigator.pushNamed(context, Routes.profile);
      } else {
        print('You has not login');
        Navigator.pushNamed(context, Routes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        usageFor: Routes.dashboard,
        onClick: _handleClickAppBar,
      ),
      body: SafeAreaWidget(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
            padding: EdgeInsets.all(0.0),
            child: Container(
              margin: EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SearchBarWidget(),
                  Image(
                    image: NetworkImage(MockUrls.BANNER_IMG_URL),
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  TextWidget(
                    text: Strings.BANNER_PROMO_INFO,
                    fontSize: Size.TITLE,
                  ),
                  ProductsGridWidget(data: products),
                ],
              ),
            )),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
