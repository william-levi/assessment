

import 'package:edamama_test/Models/Cart.dart';
import 'package:edamama_test/Models/Product.dart';

class CartController {
  Cart cart = Cart();
  void updateCart(ProductObject product, int qty) {
    final index = cart.items.value.indexWhere((element) => element.product.id == product.id);
    List<CartItemObject> items = cart.items.value;
    if(index < 0){
      CartItemObject item = CartItemObject();
      item.product = product;
      item.qty = qty;
      items.add(item);
      cart.items.value = [];
      cart.items.value = items;
    }else {

      items[index].qty += qty;
      print(items[index].qty);
      if(items[index].qty == 0){
        cart.items.value.removeAt(index);
      }
      // // cart.items.value.clear();
      cart.items.value = [];
      cart.items.value = items;
    }
    updateTotalQty();
    updateTotalPrice();
  }

  void updateTotalQty() {
    int total = 0;
    List<CartItemObject> items = cart.items.value;
    items.forEach((element) {
      total += element.qty;
    });
    cart.cartTotalQty.value = total;
  }

  void updateTotalPrice() {
    double totalPrice = 0;
    List<CartItemObject> items = cart.items.value;
    items.forEach((element) {
      totalPrice += (element.product.price * element.qty);
    });
    cart.cartTotalPrice.value = totalPrice;
  }
}