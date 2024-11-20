import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, String>> _cartItems = [];

  List<Map<String, String>> get cartItems => _cartItems;

  void addToCart(Map<String, String> product) {
    _cartItems.add(product);
    notifyListeners(); // Notify listeners about the change
  }

  void removeFromCart(Map<String, String> product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  bool get isCartEmpty => _cartItems.isEmpty;

  // Calculate the total price of the items in the cart
  double get totalPrice {
    double total = 0;
    for (var product in _cartItems) {
      total += double.tryParse(product['price']!.replaceAll('\$', '')) ?? 0.0;
    }
    return total;
  }
}
