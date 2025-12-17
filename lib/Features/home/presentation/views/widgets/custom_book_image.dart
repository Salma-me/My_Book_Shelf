import 'package:flutter/material.dart';
import 'package:my_book_shelf/core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(Assets.testImage),
        ),
      ),
    );
  }
}
