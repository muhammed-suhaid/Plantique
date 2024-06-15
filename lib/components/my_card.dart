import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final List images;
  final List name;
  final List cash;
  const MyCard({
    super.key,
    required this.images,
    required this.name,
    required this.cash,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  PageController pageController = PageController(viewportFraction: 0.7);
  double _currentPage = 0.0;
  bool isFav = true; 

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: PageView.builder(
        controller: pageController,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          double scale = (_currentPage - index).abs() < 1
              ? 1 - (_currentPage - index).abs() * 0.2
              : 0.8;
          return Transform.scale(
            scale: scale,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  height: 350,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                        child: Image.asset(
                          widget.images[index],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name[index],
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  '\$ ${widget.cash[index]}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFav = !isFav;
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: isFav
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
