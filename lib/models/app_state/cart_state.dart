import 'package:flutter/foundation.dart';
import 'package:white_label_flutter/models/products_model.dart';

class CartState with ChangeNotifier, DiagnosticableTreeMixin {
  /// state declaration
  int cartCount = 0;
  List<ProductsModel> cartItems = [];

  /// state getter/selector
  int get getCartCount => cartCount;
  List<ProductsModel> get _cartItems => cartItems;

  /// state setter/action - reducer
  void setCartCount(int val) {
    cartCount += val;
    print('cartCount $cartCount');
    notifyListeners();
  }

  void add(ProductsModel item) {
    cartItems.add(item);
    print('cartItems $cartItems');
    cartCount = cartItems.length;
    notifyListeners();
  }

  /// Makes `CartState` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('cartCount', cartCount));
    properties.add(IterableProperty('cartItems', cartItems));
  }
}
