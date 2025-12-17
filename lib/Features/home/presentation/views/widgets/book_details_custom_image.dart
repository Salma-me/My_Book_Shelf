import 'package:flutter/material.dart';
import 'package:my_book_shelf/core/utils/assets.dart';

class BookDetailsCustomImage extends StatelessWidget {
  const BookDetailsCustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(Assets.testImage),
          ),
        ),
      ),
    );
  }
}
