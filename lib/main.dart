import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:madgains/Components/MainScreens.dart';
import 'package:madgains/MainScreens/HomeScreen.dart';
import 'package:madgains/StartScreens/splash.dart';
import 'package:madgains/MainScreens/Favorite/FavProvider.dart';
import 'MainScreens/Cart/CartProvider.dart';
import 'helper/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()), // Provide CartProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreens(),
    );
  }
}
