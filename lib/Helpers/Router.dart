

import 'package:edamama_test/Common/RouteData.dart';
import 'package:edamama_test/Views/Cart.dart';
import 'package:edamama_test/Views/Home.dart';
import 'package:edamama_test/Views/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterHelper {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name) {
      
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case cartRoute:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case productRoute:
        return MaterialPageRoute(builder: (_) => ProductScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}