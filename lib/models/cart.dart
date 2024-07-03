import 'package:flutter/material.dart';

import 'product.dart';

class Cart {
  final ValueNotifier<List<Product>> _cartItemsNotifier =
      ValueNotifier<List<Product>>([]);

  List<Product> get cartItems => _cartItemsNotifier.value;

  void showSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Item added to cart!'),
      duration: Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void addToCart(Product item) {
    bool found = false;
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].productId == item.productId) {
        cartItems[i].quantity++;
        found = true;
        break;
      }
    }
    if (!found) {
      item.quantity = 1;
      _cartItemsNotifier.value = List.from(_cartItemsNotifier.value)..add(item);
    }
  }

  void removeFromCart(Product item) {
    for (int i = 0; i < cartItems.length; i++) {
      _cartItemsNotifier.value = List.from(_cartItemsNotifier.value)
        ..removeAt(i);
    }
  }

  String calcTotal() {
    int totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += cartItems[i].price * cartItems[i].quantity;
    }
    return totalPrice.toString();
  }

  ValueNotifier<List<Product>> get cartItemsNotifier => _cartItemsNotifier;
}
