import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importez le package Provider
import 'package:market_pay/screens/screen1.dart';
import 'package:market_pay/class/cartprovider.dart'; // Importez votre CartProvider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CartProvider()), // Ajout de CartProvider
      ],
      child: const MaterialApp(
        home: Screen1(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
