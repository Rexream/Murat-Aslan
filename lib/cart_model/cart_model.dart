import 'package:flutter/material.dart';
import 'package:stajproje/models/product_model.dart';

class CartModel extends ChangeNotifier {
  List<Products> cardProduct = [];

  List<Products> returnCard() {
    return cardProduct;
  }

  void cardAdd(Products product) {
    cardProduct.add(product);
    notifyListeners();
  }

  void cardRemove(Products product) {
    cardProduct.remove(product);
    notifyListeners();
  }

  void cardProductsRemove() {
    cardProduct.clear();
    notifyListeners();
  }
}
