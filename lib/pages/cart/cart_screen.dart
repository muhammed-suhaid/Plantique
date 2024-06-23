import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plantique/components/my_button.dart';
import 'package:plantique/models/cart.dart';
import 'package:plantique/provider/plant_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //clear cart
    void clearCart() {
      ref.watch(plantProvider).clearCart();
    }

    //clear cart
    void removeFromCart(CartItem cartItem) {
      ref.watch(plantProvider).removeFromCart(cartItem);
    }

    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 18,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Cart',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      clearCart();
                    },
                    child: const Text('clear'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ref.watch(plantProvider).cart.isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: height / 3),
                        child: const Center(
                          child: Text('Cart is empty'),
                        ),
                      )
                    : ListView.builder(
                        itemCount: ref.read(plantProvider).cart.length,
                        itemBuilder: (context, index) {
                          CartItem cart = ref.read(plantProvider).cart[index];
                          return Container(
                            height: 100,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: Image.asset(
                                      cart.plant.image,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cart.plant.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text('Size :  '),
                                          Text(cart.plant.size),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Price :  '),
                                          Text('\$${cart.plant.price}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      removeFromCart(cart);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 10),
              MyButton(
                text: '\$ ${ref.read(plantProvider).getTotalPrice()}',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
