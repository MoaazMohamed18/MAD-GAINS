import 'package:flutter/material.dart';
import 'package:madgains/Components/colors.dart';
import 'package:provider/provider.dart';
import 'CartProvider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: const Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            return Column(
              children: [
                if (cartProvider.cartItems.isEmpty)
                  const Center(child: Text("Your cart is empty")),
                ...cartProvider.cartItems.map((product) {
                  return ListTile(
                    title: Text(product['title']!),
                    subtitle: Text(product['price']!),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cartProvider.removeFromCart(product);
                      },
                    ),
                  );
                }).toList(),
                if (!cartProvider.isCartEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            _showCheckoutConfirmation(context, cartProvider);
                          },
                          child: const Text("Checkout"),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showCheckoutConfirmation(BuildContext context, CartProvider cartProvider) {
    // Show confirmation message and receipt
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Purchase Successful"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("You have successfully purchased the following items:"),
              ...cartProvider.cartItems.map((product) {
                return Text("${product['title']} - ${product['price']}");
              }).toList(),
              const SizedBox(height: 10),
              Text("Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}"),
              const SizedBox(height: 10),
              const Text("Thank you for your purchase!"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Clear the cart after successful purchase
                cartProvider.cartItems.clear();
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
