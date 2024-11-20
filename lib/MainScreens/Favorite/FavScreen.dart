import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Components/colors.dart';
import 'FavProvider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, provider, child) {
          if (provider.favorites.isEmpty) {
            return const Center(child: Text("No favorites added yet"));
          }
          return ListView.builder(
            itemCount: provider.favorites.length,
            itemBuilder: (context, index) {
              final product = provider.favorites[index];
              return ListTile(
                title: Text(product['title']!),
                subtitle: Text(product['subtitle']!),
                trailing: IconButton(
                  onPressed: () {
                    provider.toggleFavorite(product); // Remove from favorites
                  },
                  icon: Icon(
                    provider.isFavorited(product)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: provider.isFavorited(product) ? Colors.orange : null,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
