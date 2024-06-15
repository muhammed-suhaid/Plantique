import 'package:flutter/material.dart';

class MyCategory extends StatefulWidget {
  final List category;
  const MyCategory({
    super.key,
    required this.category,
  });

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.category.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 18,
              right: index == widget.category.length - 1 ? 18 : 0,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    widget.category[index],
                    style: TextStyle(
                      color: currentIndex == index ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
