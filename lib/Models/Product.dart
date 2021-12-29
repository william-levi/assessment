
import 'package:flutter/cupertino.dart';

class Products {
  static final Products _instance = Products._internalConst();
  Products._internalConst();
  factory Products() => _instance;
  ValueNotifier<List<ProductObject>> list = ValueNotifier([]);
  ValueNotifier<ProductObject> currentProduct = ValueNotifier(ProductObject());
}

class ProductObject {
  late int id;
  late String title;
  late double price;
  late String description;
  late String category;
  late String image;
  late RatingObject rating;
  ProductObject();
  factory ProductObject.fromJson(Map<String,dynamic> json ) {
    ProductObject product = ProductObject();
    product.id = json["id"];
    product.title = json["title"];
    product.price = double.parse(json["price"].toString());
    product.description = json["description"];
    product.category = json["category"];
    product.image = json["image"];
    product.rating = RatingObject(
      rate: double.parse(json["rating"]["rate"].toString()),
      count: json["rating"]["count"]
    );
    return product;
  }
}

class RatingObject {
  late double rate;
  late int count;

  RatingObject({ this.rate = 0, this.count = 0});
}