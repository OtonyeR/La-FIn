import 'package:flutter/material.dart';
import 'package:la_fin/models/cart.dart';
import 'package:la_fin/screens/home.dart';

import '../models/product.dart';
import 'Checkout.dart';

class NavPage extends StatefulWidget {
  final Cart cart = Cart();

  NavPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeScreen(cart: widget.cart),
      CheckoutScreen(cart: widget.cart),
    ];
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: ValueListenableBuilder<List<Product>>(
        valueListenable: widget.cart.cartItemsNotifier,
        builder: (context, cartItems, child) {
          return BottomNavigationBar(
            currentIndex: _pageIndex,
            selectedItemColor: const Color.fromRGBO(36, 36, 36, 1.0),
            unselectedItemColor: const Color.fromRGBO(36, 36, 36, 1.0),
            selectedIconTheme: IconThemeData(size: 26),
            onTap: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chair_alt_outlined,
                  weight: 0.5,
                ),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: Stack(children: <Widget>[
                  Icon(
                    Icons.shopping_bag_outlined,
                    weight: 0.5,
                  ),
                  if (widget.cart.cartItems.isNotEmpty) ...[
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          widget.cart.cartItems.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ]),
                label: 'Cart',
              ),
            ],
          );
        },
      ),
    );
  }
}
