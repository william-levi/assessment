

import 'package:badges/badges.dart';
import 'package:edamama_test/Common/RouteData.dart';
import 'package:edamama_test/Controllers/Cart.dart';
import 'package:edamama_test/Models/Cart.dart';
import 'package:edamama_test/Models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatelessWidget {
  final Products products = Products();
  final Cart cart = Cart();
  final CartController cartController = CartController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'PRODUCT DETAIL',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, cartRoute);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: ValueListenableBuilder(
                valueListenable: cart.cartTotalQty,
                builder: (_,int value,__) => Badge(
                  showBadge: value > 0,
                  position: BadgePosition.topStart(top: 5.0, start: 14.0),
                  animationType: BadgeAnimationType.scale,
                  animationDuration: const Duration(milliseconds: 150),
                  badgeContent: Text(
                    "$value",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 5, top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(
                          1, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                NetworkImage(products.currentProduct.value.image),
                                fit: BoxFit.contain)),
                      ),

                    ),
                    RatingBarIndicator(
                      rating: products.currentProduct.value.rating.rate,
                      itemBuilder: (context,index) => Icon(Icons.star, color: Colors.amber),
                    ),
                    Text(products.currentProduct.value.title, maxLines: 2,textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
              margin: EdgeInsets.only(bottom: 5, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(
                        1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products.currentProduct.value.description),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Category: ${products.currentProduct.value.category.toUpperCase()}"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Price: Php ${products.currentProduct.value.price.toStringAsFixed(2)}"),

                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cartController.updateCart(products.currentProduct.value, 1);
              },
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25)),
                onPrimary: Colors.white,
                primary: Color(0xFF223756),
              ),
              child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}