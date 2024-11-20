import 'package:flutter/material.dart';
import '../../Components/colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productName;

  const ProductDetailsScreen({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(productName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/5.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                "EUPHORIQ PRE-WORKOUT",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Need a less-jittery energy boost? MuscleTech EuphoriQ has got you covered. Its unique blend of ingredients, including paraxanthine, taurine, and huperzine-A, provide a sustained and smooth energy boost that keeps you focused.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                "Available Flavors:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: const [
                  Chip(label: Text("Boogieman Punch")),
                  Chip(label: Text("Yuzu Lemonade")),
                  Chip(label: Text("Watermelon Candy")),
                  Chip(label: Text("Icy Snow Cone")),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "\$54.99",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add to cart functionality
                },
                child: const Text("Add to Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}