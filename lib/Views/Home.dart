
import 'package:badges/badges.dart';
import 'package:edamama_test/Common/RouteData.dart';
import 'package:edamama_test/Controllers/Cart.dart';
import 'package:edamama_test/Controllers/Product.dart';
import 'package:edamama_test/Models/Cart.dart';
import 'package:edamama_test/Models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final ProductController productController = ProductController();
  final CartController cartController = CartController();
  final Cart cart = Cart();
  @override
  void initState() {
    // TODO: implement initState
    productController.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Cart cart = Cart();
    final Products products = Products();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu,color: Colors.black,),
        title: Text("Shop",style: TextStyle(color: Colors.black),),
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
      body:  Container(
          // padding: EdgeInsets.all(20),
          child: ValueListenableBuilder(
            valueListenable: products.list,
            builder: (_,List<ProductObject> productLists,__) => Column(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    // margin: EdgeInsets.only(bottom: 20),
                    child: GridView.count(
                      childAspectRatio: 0.62,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      children: [
                        for(var object in productLists)
                          GestureDetector(
                              onTap: () {
                                products.currentProduct.value = object;
                                Navigator.pushNamed(context, productRoute);
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                                margin: EdgeInsets.only(bottom: 5, top: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
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
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("\$${object.price.toStringAsFixed(2)}"),
                                          GestureDetector(
                                            onTap: (){
                                              cartController.updateCart(object, 1);
                                            },
                                            child: Icon(Icons.add_shopping_cart),
                                          )
                                        ],
                                      ),
                                      Flexible(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image:
                                                  NetworkImage(object.image),
                                                  fit: BoxFit.contain)),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Text("${object.title.toUpperCase()}",style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                          )
                      ],
                    ),
                  ),
                )


              ],
            ),
          )
      )
    );
  }
}