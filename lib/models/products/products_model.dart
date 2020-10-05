import 'dart:convert';

class ProductsModel {
  String image;
  String name;
  PricesModel prices;

  // String normal;
  // String discounted;

  ProductsModel({
    this.image,
    this.name,
    this.prices,
    // this.normal,
    // this.discounted
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      image: json["image"],
      name: json["name"],
      prices: json['prices'] != null ? new PricesModel.fromJson(json['prices']) : null,
      // prices: map["prices"],
      // normal: map["normal"],
      // discounted: map["discounted"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"image": image, "name": name, "prices": prices};
    // return {"image": image, "name": name};
  }

  @override
  String toString() {
    return 'ProductsModel{"image": $image, "name": $name, "prices": $prices}';
    // return 'ProductsModel{"image": $image, "name": $name}';
  }
}

class PricesModel {
  int discounted;
  int normal;

  PricesModel({this.discounted, this.normal});

  PricesModel.fromJson(Map<String, dynamic> json) {
    discounted = json['discounted'];
    normal = json['normal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discounted'] = this.discounted;
    data['normal'] = this.normal;
    return data;
  }
}

List<ProductsModel> productsFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<ProductsModel>.from(
      data.map((item) => ProductsModel.fromJson(item)));
}

String productsToJson(ProductsModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
