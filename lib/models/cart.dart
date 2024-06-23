import 'package:plantique/models/plant.dart';

class CartItem {
  Plant plant;
  int quantity;

  CartItem({
    required this.plant,
    this.quantity = 1,
  });
}
