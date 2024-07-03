import 'package:flutter/material.dart';
import 'package:la_fin/screens/nav.dart';

import '../models/cart.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart bag = Cart();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'SUCCESS!',
                  style: TextStyle(
                      color: Color.fromRGBO(48, 48, 48, 1.0),
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    size: 100,
                    weight: 2,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Your order will be delivered soon.Thank you for choosing our app!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(96, 96, 96, 1.0)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavPage()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(36, 36, 36, 1.0),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(48, 48, 48, 0.25),
                              blurRadius: 20,
                              offset: Offset(0.0, 10.0))
                        ]),
                    child: Center(
                      child: const Text(
                        'BACK TO HOME',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
