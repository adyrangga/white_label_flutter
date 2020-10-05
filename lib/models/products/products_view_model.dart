import 'package:white_label_flutter/data/network/endpoints.dart';
import 'package:white_label_flutter/data/network/rest_client.dart';
import 'package:white_label_flutter/models/products/products_model.dart';

class ProductsViewModel {
  RestClient resClient = RestClient();

  Future<List<ProductsModel>> getProducts() async {
    final response = await resClient.get(Endpoints.getProducts);
    return productsFromJson(response.toString());
  }
}