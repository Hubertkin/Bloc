import 'package:flutter/material.dart';

import 'features/cart/ui/cart.dart';
import 'features/home/ui/Home.dart';
import 'features/wishlist/ui/wishlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc_Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          secondary: Colors.tealAccent,
        ),

        /// Sets the color scheme for the application, defining the colors and their
        /// usage throughout the app. The `ColorScheme.light()` constructor creates a
        /// color scheme with a set of predefined light colors, which can be used to
        /// style the app's UI elements consistently.
      ),
      routes: {
        '/': (context) => const Home(),
        '/wishlist': (context) => const Wishlist(),
        '/cart': (context) => const Cart(),
      },
    );
  }
}
