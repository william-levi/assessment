

import 'package:edamama_test/Models/Product.dart';
import 'package:flutter/cupertino.dart';

class Cart {
  static final Cart _instance = Cart._internalConst();
  Cart._internalConst();
  factory Cart() => _instance;
  ValueNotifier<List<CartItemObject>> items = ValueNotifier([]);
  ValueNotifier<double> cartTotalPrice = ValueNotifier(0);
  ValueNotifier<int> cartTotalQty = ValueNotifier(0);
}

class CartItemObject {
  late ProductObject product;
  late int qty;
}