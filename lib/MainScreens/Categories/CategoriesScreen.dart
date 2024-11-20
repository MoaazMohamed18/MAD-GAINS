import 'package:flutter/material.dart';

import '../../Components/colors.dart';
import 'Products.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: const Text("Categories"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildCategoryCard(
            "Creatine",
            "assets/images/1.jpg",
                () => _navigateToProductScreen(context, "Creatine"),
          ),
          _buildCategoryCard(
            "Whey Protein",
            "assets/images/2.jpg",
                () => _navigateToProductScreen(context, "Whey Protein"),
          ),
          _buildCategoryCard(
            "Pre-workout",
            "assets/images/3.jpg",
                () => _navigateToProductScreen(context, "Pre-workout"),
          ),
          _buildCategoryCard(
            "Fat Burners",
            "assets/images/4.jpg",
                () => _navigateToProductScreen(context, "Fat Burners"),
          ),
          _buildCategoryCard(
            "Post-Workout",
            "assets/images/5.jpg",
                () => _navigateToProductScreen(context, "Post-Workout"),
          ),
          _buildCategoryCard(
            "Weight Gainers",
            "assets/images/6.jpg",
                () => _navigateToProductScreen(context, "Weight Gainers"),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String image, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(color: whiteColor,
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 80, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _navigateToProductScreen(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(category: category),
      ),
    );
  }
}
