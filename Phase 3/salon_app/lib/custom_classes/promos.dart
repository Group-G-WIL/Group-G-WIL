import 'package:flutter/material.dart';

class Promos {
  String name;
  int discount;
  Image image;

  Promos(this.name, this.discount, this.image);

  String get promoName {
    return name;
  }

  set promoName(String value) {
    name = value;
  }

  int get promoDiscount {
    return discount;
  }

  set promoDiscount(int value) {
    discount = value;
  }

  Image get promoImage {
    return image;
  }

  set promoImage(Image value) {
    image = value;
  }
}
