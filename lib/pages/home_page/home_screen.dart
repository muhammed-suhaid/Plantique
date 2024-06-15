import 'package:flutter/material.dart';
import 'package:plantique/components/my_appbar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppbar(),
              const SizedBox(height: 30),
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
              const SizedBox(height: 10),
              const MySearchBar(),
              const SizedBox(height: 20), 
              MyCategory(category: category,)
            ],
          ),
        ),
      ),
    );
  }
}
