import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plantique/components/my_button.dart';
import 'package:plantique/components/plant_mini_details.dart';
import 'package:plantique/models/plant.dart';
import 'package:plantique/provider/plant_provider.dart';

class PlantDetailsScreen extends ConsumerWidget {
  final Plant plant;
  const PlantDetailsScreen({
    super.key,
    required this.plant,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //addToCart
    void addToCart() {
      Navigator.pop(context);
      ref.read(plantProvider).addToCart(plant);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                    Text(
                      'Plant Details',
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image.asset(
                plant.image,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          plant.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      plant.description,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    PlantMiniDetails(plant: plant),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Center(
                            child: Text(
                              '\$${plant.price}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: MyButton(
                            text: 'Add to Cart',
                            onTap: () {
                              addToCart();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
