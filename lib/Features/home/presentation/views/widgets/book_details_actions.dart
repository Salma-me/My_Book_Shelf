import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/core/utils/functions/launch_url.dart';
import 'package:my_book_shelf/core/widgets/custom_button.dart';

class BookDetailsActions extends StatelessWidget {
  const BookDetailsActions({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              // text: '19.99 €',
              text: 'Free',
              fontSize: 20,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                customLaunchUrl(context, book.previewLink);
              },
              fontSize: 16,
              backgroundColor: Color(0xffF08363),
              textColor: Colors.white,
              text: 'Free Preview',
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
