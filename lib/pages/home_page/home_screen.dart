import 'package:flutter/material.dart';
import 'package:plantique/components/my_appbar.dart';
import 'package:plantique/components/my_card.dart';
import 'package:plantique/components/my_category.dart';
import 'package:plantique/components/my_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> category = [
    'All',
    'Outdoor',
    'Indoor',
    'Office',
    'Garden',
  ];
  List<String> plantImages = [
    'assets/images/plant1.png',
    'assets/images/plant2.png',
    'assets/images/plant3.png',
    'assets/images/plant4.png',
    'assets/images/plant5.png',
  ];
  List<String> plantName = [
    'Aspidistra Elatior',
    'Dracaena Fragrans',
    'Arecaceae palm',
    'Areca plam',
    'Bird of paradise',
  ];
  List<String> plantCash = [
    '15.50',
    '10.00',
    '25.75',
    '10.50',
    '12.75',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppbar(),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Find Best Plants\nFor You!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const MySearchBar(),
              const SizedBox(height: 30),
              MyCategory(
                category: category,
              ),
              const SizedBox(height: 30),
              MyCard(
                images: plantImages,
                name: plantName,
                cash: plantCash,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
