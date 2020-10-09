import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:white_label_flutter/models/products_model.dart';
import 'package:white_label_flutter/view_models/products_view_model.dart';

class AppState with ChangeNotifier, DiagnosticableTreeMixin {
  /// define state
  List<ProductsModel> productList = [];

  /// get state / selectors
  List<ProductsModel> get selectProductList => productList;

  /// set state / action-reducer
  void fetchProductList() async {
    var result = await ProductsViewModel().getProducts().then((value) => value);
    productList = result;
    notifyListeners();
  }

  /// Makes this class readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('productList', productList));
  }
}