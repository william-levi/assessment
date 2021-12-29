

import 'package:edamama_test/Controllers/Cart.dart';
import 'package:edamama_test/Models/Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget  {
  final Cart cart = Cart();
  final CartController cartController = CartController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'CART',
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
      ),
      body: Container(
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: cart.items,
              builder: (_,List<CartItemObject> cartItems,__) {
                print("items updated");
                return Column(
                  children: [
                    for (var object in cartItems)
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.grey.withOpacity(0.6)))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          cartController.updateCart(object.product, 1);
                                        },
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(left: 3.0, right: 3.0),
                                          child: Icon(
                                            Icons.add_circle,
                                            color: Colors.green,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.only(left: 3.0, right: 3.0),
                                        child: Text(
                                          "${object.qty}",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w300),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          cartController.updateCart(object.product, -1);
                                        },
                                        child: Padding(
                                          padding:
                                          EdgeInsets.only(left: 3.0, right: 3.0),
                                          child: Icon(
                                            Icons.remove_circle,
                                            color: Colors.red,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(object.product.image),
                                            fit: BoxFit.contain)),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${object.product.title.toUpperCase()}",style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,maxLines: 2,),
                                        Text("@ \$${ object.product.price.toStringAsFixed(2) }")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text("\$${(object.product.price * object.qty).toStringAsFixed(2)}")
                          ],
                        ),
                      )
                  ],
                );
              },
            ),
          )),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(
              left: 10.0, right: 10.0, top: 20.00, bottom: 10.00),
          height: 160.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total:", style: TextStyle(fontSize: 20)),
                  ValueListenableBuilder(valueListenable: cart.cartTotalPrice, builder: (_,double value,__) => Text("\$${value.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 20)))
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text("CHECKOUT")),
              )
            ],
          ),
        ),
      ),
    );
  }
}