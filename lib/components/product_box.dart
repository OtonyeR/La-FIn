import 'package:flutter/material.dart';
import 'package:la_fin/models/cart.dart';
import 'package:la_fin/models/product.dart';

import 'currency_text.dart';

class ProductBox extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final VoidCallback onAddToCart;

  const ProductBox({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.onAddToCart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imageUrl), // Replace with your image path
                    fit: BoxFit.cover, // Adjust as needed
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: GestureDetector(
                  onTap: onAddToCart,
                  child: Image.asset('assets/Frame 19.png'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              color: Color.fromRGBO(96, 96, 96, 1.0),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            price,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CartBox extends StatefulWidget {
  final Product cartItem;
  // final String itemCount;
  final VoidCallback onRemoveItem;
  final VoidCallback onReduceQuantity;
  final VoidCallback onIncreaseQuantity;

  const CartBox({
    required this.cartItem,
    super.key,
    required this.onRemoveItem,
    required this.onReduceQuantity,
    required this.onIncreaseQuantity,
    // required this.itemCount,
  });

  @override
  State<CartBox> createState() => _CartBoxState();
}

class _CartBoxState extends State<CartBox> {
  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(
                      widget.cartItem.imageUrl), // Replace with your image path
                  fit: BoxFit.cover, // Adjust as needed
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Wrap(
                direction: Axis.vertical,
                spacing: 8,
                runAlignment: WrapAlignment.start,
                children: [
                  Text(
                    widget.cartItem.name,
                    style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1.0),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'N${priceText(widget.cartItem.price.toString())}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: widget.onIncreaseQuantity,
                        child: Container(
                          height: 25,
                          width: 25,
                          padding: EdgeInsets.all(3),
                          margin: EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.add,
                            color: Color.fromRGBO(144, 144, 144, 1.0),
                            size: 18,
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(224, 224, 224, 1.0),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Text(widget.cartItem.quantity.toString()),
                      GestureDetector(
                        onTap: widget.cartItem.quantity > 1
                            ? widget.onReduceQuantity
                            : widget.onRemoveItem,
                        child: Container(
                          height: 25,
                          width: 25,
                          padding: EdgeInsets.all(3),
                          margin: EdgeInsets.only(left: 6),
                          child: Icon(
                            Icons.remove,
                            color: Color.fromRGBO(144, 144, 144, 1.0),
                            size: 18,
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(224, 224, 224, 1.0),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: widget.onRemoveItem,
              child: Icon(
                Icons.cancel_outlined,
                color: Colors.black,
              ),
            )
          ],
        ),
        Divider(),
      ],
    );
  }
}
