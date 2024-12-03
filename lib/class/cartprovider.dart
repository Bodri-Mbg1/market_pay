import 'package:flutter/material.dart';
import 'package:market_pay/class/produit.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  double get subtotal => _cartItems.fold(
        0,
        (total, item) => total + (item.price * item.quantity),
      );

  void addItemToCart(Product product) {
    // Vérifier si le produit est déjà dans le panier
    final index = _cartItems.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      _cartItems[index].quantity += product.quantity;
    } else {
      _cartItems.add(product);
    }
    notifyListeners();
  }

  void removeItemFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void updateQuantity(Product product, int newQuantity) {
    final index = _cartItems.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners();
    }
  }
}
