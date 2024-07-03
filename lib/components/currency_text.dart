import 'package:flutter/material.dart';

String priceText(String input) {
  if (input.length < 4 || input.length > 6) {
    return input;
  }
  int positionFromEnd = 3;
  int insertPosition = input.length - positionFromEnd;

  // Split the string into two parts and insert the comma
  String part1 = input.substring(0, insertPosition);
  String part2 = input.substring(insertPosition);

  return part1 + ',' + part2;
}
