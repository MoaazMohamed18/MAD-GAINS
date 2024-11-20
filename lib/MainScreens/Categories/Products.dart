import 'package:flutter/material.dart';
import '../../Components/colors.dart';
import 'ProductDetails.dart';

class ProductScreen extends StatelessWidget {
  final String category;

  const ProductScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(category),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildProductCard(
            context,
            "EUPHORIQ Poogie Man Punch",
            "assets/images/1.jpg",
            "\$44.99",
          ),
          _buildProductCard(
            context,
            "EUPHORIQ Icy Snow Cone",
            "assets/images/1.jpg",
            "\$44.99",
          ),
          _buildProductCard(
            context,
            "EUPHORIQ Watermelon Candy",
            "assets/images/1.jpg",
            "\$44.99",
          ),
          _buildProductCard(
            context,
            "EUPHORIQ Yuzu Lemonade",
            "assets/images/1.jpg",
            "\$44.99",
          ),
          _buildProductCard(
            context,
            "SHATTER Ripped Icy Rocket",
            "assets/images/1.jpg",
            "\$29.99",
          ),
          _buildProductCard(
            context,
            "SHATTER Ripped Rainbow Candy",
            "assets/images/1.jpg",
            "\$29.99",
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context,
      String title,
      String image,
      String price,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(productName: title),
          ),
        );
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image, height: 100, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                price,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
