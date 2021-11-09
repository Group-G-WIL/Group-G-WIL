import 'package:flutter/material.dart';

class Items {
  String name;
  double cost;
  Image image;

  Items(this.name, this.cost, this.image);

  String get itemName {
    return name;
  }

  set itemName(String value) {
    name = value;
  }

  double get itemCost {
    return cost;
  }

  set itemCost(double value) {
    cost = value;
  }

  Image get itemImage {
    return image;
  }

  set itemImage(Image value) {
    image = value;
  }
}
