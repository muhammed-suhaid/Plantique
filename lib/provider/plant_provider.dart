import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plantique/models/cart.dart';
import 'package:plantique/models/plant.dart';

final plantProvider = ChangeNotifierProvider((ref) => PlantProvider());

class PlantProvider extends ChangeNotifier {
  final List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;

  void addToCart(Plant plant) {
    _cart.add(
      CartItem(plant: plant),
    );
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      _cart.removeAt(cartIndex);
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.plant.price;

      total += itemTotal;
    }
    return total;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
