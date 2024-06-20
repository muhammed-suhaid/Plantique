import 'package:flutter/material.dart';
import 'package:plantique/models/plant.dart';

class PlantMiniDetails extends StatelessWidget {
  final Plant plant;
  const PlantMiniDetails({
    super.key,
    required this.plant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Image.asset(
                  'assets/icons/plant.png',
                  scale: 18,
                ),
              ),
              const Text(
                'Size',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                plant.size,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Image.asset(
                  'assets/icons/water.png',
                  scale: 18,
                ),
              ),
              const Text(
                'Water',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                plant.water,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Image.asset(
                  'assets/icons/light.png',
                  scale: 18,
                ),
              ),
              const Text(
                'Light',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                plant.light,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    'assets/icons/humidity.png',
                    scale: 18,
                  ),
                ),
              ),
              const Text(
                'Humidity',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                plant.humidity,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
