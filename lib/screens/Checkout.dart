import 'package:flutter/material.dart';
import 'package:la_fin/components/currency_text.dart';

import '../components/product_box.dart';
import '../models/cart.dart';
import 'order_confirm.dart';

class CheckoutScreen extends StatefulWidget {
  final Cart cart;
  CheckoutScreen({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromRGBO(36, 36, 36, 1.0)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        child: Column(
          children: [
            widget.cart.cartItems.isEmpty
                ? Expanded(
                    child: Center(
                      child: Text(
                        'No Items in Cart! \n Please help Our Market!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: widget.cart.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartBox(
                          cartItem: widget.cart.cartItems[index],
                          onRemoveItem: () {
                            setState(() {
                              widget.cart
                                  .removeFromCart(widget.cart.cartItems[index]);
                            });
                          },
                          onReduceQuantity: () {
                            setState(() {
                              widget.cart.cartItems[index].quantity--;
                            });
                          },
                          onIncreaseQuantity: () {
                            setState(() {
                              widget.cart.cartItems[index].quantity++;
                            });
                          },
                        );
                      },
                    ),
                  ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1.0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'N${priceText(widget.cart.calcTotal())}',
                        style: const TextStyle(
                            color: Color.fromRGBO(36, 36, 36, 1.0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (widget.cart.calcTotal() == '0') {
                      const snackBar = SnackBar(
                        content: Text('Cart is empty!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ConfirmScreen()),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(36, 36, 36, 1.0),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(48, 48, 48, 0.25),
                              blurRadius: 20,
                              offset: Offset(0.0, 10.0))
                        ]),
                    child: const Center(
                      child: Text(
                        'SUBMIT ORDER',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
