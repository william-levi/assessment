

import 'dart:convert';

import 'package:edamama_test/Common/HttpServiceData.dart';
import 'package:edamama_test/Helpers/HttpService.dart';
import 'package:edamama_test/Models/Product.dart';

class ProductController {
  final HttpService httpService = HttpService();
  Products productsModel = Products();
  Future fetchProducts() async {
    productsModel.list.value.clear();
    String response = await httpService.getRequest("/products");
    print(response);
    List<dynamic> data = json.decode(response);
    List<ProductObject> products = data.map((e) => ProductObject.fromJson(e) ).toList(growable: true);
    productsModel.list.value = products;
    print(productsModel.list.value.length);
  }
}