import 'package:audio/Model/featured_product_model.dart';
import 'package:flutter/material.dart';

class TheCart extends ChangeNotifier {
  List cartProducts = [];
  int priceOfProducts = 0;
  addToCart(FeaturedModel product) async {
    cartProducts.add(product);
    priceOfProducts += product.price;
    notifyListeners();
  }

  deleteFromCart(FeaturedModel product) {
    cartProducts.remove(product);
    priceOfProducts -= product.price;
    notifyListeners();
  }

  deleteAllFromCart() {
    cartProducts.clear();
    priceOfProducts -= priceOfProducts;

    notifyListeners();
  }
}
