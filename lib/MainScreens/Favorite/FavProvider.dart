import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  List<Map<String, String>> _favorites = [];

  // Getter for favorites list
  List<Map<String, String>> get favorites => _favorites;

  // Toggle favorite product
  void toggleFavorite(Map<String, String> product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();  // Notify listeners to update the UI
  }

  // Check if a product is favorited
  bool isFavorited(Map<String, String> product) {
    return _favorites.contains(product);
  }
}
