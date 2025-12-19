import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/custom_book_image.dart';

class SuggestedBooksHListView extends StatelessWidget {
  const SuggestedBooksHListView({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: deviceHeight * 0.12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: SizedBox(
              height: deviceHeight * 0.11,
              width: MediaQuery.of(context).size.width * 0.17,
              child: CustomBookImage(),
            ),
          );
        },
      ),
    );
  }
}
