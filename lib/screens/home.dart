import 'package:flutter/material.dart';
import 'package:la_fin/components/currency_text.dart';
import 'package:la_fin/components/list_tags.dart';
import 'package:la_fin/components/product_box.dart';
import 'package:la_fin/models/categories.dart';
import 'package:la_fin/models/product_data.dart';

import '../models/cart.dart';
import '../models/product.dart'; // Assuming you have this model

class HomeScreen extends StatefulWidget {
  final Cart cart;
  const HomeScreen({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Popular';

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  List<Product> getFilteredProducts() {
    if (selectedCategory == 'Popular') {
      return productList;
    } else {
      return productList
          .where((product) => product.category == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = getFilteredProducts();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'La fin.',
                    style: TextStyle(
                        color: Color.fromRGBO(144, 144, 144, 1.0),
                        fontSize: 24,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Timeless Designs for Modern Living',
                    style: TextStyle(
                        color: Color.fromRGBO(36, 36, 36, 1.0),
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return categoryTab(
                            iconUrl: categoryList[index].iconUrl,
                            name: categoryList[index].name,
                            catTap: () {
                              selectCategory(categoryList[index].name);
                            },
                            isSelected:
                                selectedCategory == categoryList[index].name);
                      }),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Expanded(
                flex: 7,
                child: filteredProducts.isEmpty
                    ? Center(
                        child: Text(
                          'We\'re sorry! \n Pieces under the \'$selectedCategory\' category are currently unavailable',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        cacheExtent: filteredProducts.length.toDouble(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 30.0,
                          mainAxisSpacing: 0,
                          childAspectRatio:
                              0.55, // Adjust to your desired aspect ratio
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          return ProductBox(
                            name: filteredProducts[index].name,
                            imageUrl: filteredProducts[index].imageUrl,
                            price:
                                'N${priceText(filteredProducts[index].price.toString())}',
                            onAddToCart: () {
                              setState(() {
                                widget.cart.addToCart(filteredProducts[index]);
                                widget.cart.showSnackBar(context);
                              });
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
