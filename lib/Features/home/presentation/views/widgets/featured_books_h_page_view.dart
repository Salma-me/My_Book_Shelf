import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/custom_book_item.dart';

class FeaturedBooksHPageView extends StatefulWidget {
  const FeaturedBooksHPageView({super.key});

  @override
  State<FeaturedBooksHPageView> createState() => _FeaturedBooksHPageViewState();
}

class _FeaturedBooksHPageViewState extends State<FeaturedBooksHPageView> {
  late final PageController _controller;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    initPageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: SizedBox(
        // height: 280,
        height: MediaQuery.of(context).size.height * 0.28,
        child: PageView.builder(
          padEnds: false,
          controller: _controller,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            double scale = getItemScale(index);
            return Transform.scale(scale: scale, child: const CustomBookItem());
          },
        ),
      ),
    );
  }

  void initPageController() {
    _controller = PageController(viewportFraction: 0.45)
      ..addListener(() {
        setState(() {
          _currentPage = _controller.page!;
        });
      });
  }

  double getItemScale(int index) {
    // Get item distance from center
    // Start at scale 1.0
    // Shrink by 0.3 for each step away
    final scale = (1 - (_currentPage - index).abs() * 0.3).clamp(0.8, 1.0);
    return scale;
  }
}
