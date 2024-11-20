import 'package:flutter/material.dart';
import 'package:madgains/Components/colors.dart';
import 'package:provider/provider.dart';
import 'Cart/CartProvider.dart';
import 'Favorite/FavProvider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text("Welcome Back"),
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: PageView(
                children: [
                  Image.asset("assets/images/ad1.png"),
                  Image.asset("assets/images/ad2.png"),
                  Image.asset("assets/images/ad3.png"),
                ],
              ),
            ),
            _buildSection("Popular Items"),
            _buildSection("Flash Sale"),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    final products = [
      {"title": "CELL-TECH", "subtitle": "Fruit Punch", "price": "\$47.7"},
      {"title": "EUPHORIQ", "subtitle": "Poogie Man Punch", "price": "\$44.99"},
      {"title": "EAAs+", "subtitle": "Energy Drink", "price": "\$29.99"},
      {"title": "Mass Tech", "subtitle": "Chocolate", "price": "\$49.99"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: blueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              const Text("See All", style: TextStyle(color: blueColor)),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _buildProductCard(products[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        return Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            return Container(
              width: 150,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          favoritesProvider.toggleFavorite(product); // Toggle favorite
                        },
                        icon: Icon(
                          favoritesProvider.isFavorited(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoritesProvider.isFavorited(product)
                              ? Colors.orange
                              : null,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Image.asset("assets/images/1.jpg")),
                  Text(product['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(product['subtitle']!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(product['price']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.shopping_bag),
                        onPressed: () {
                          cartProvider.addToCart(product); // Add product to cart
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
