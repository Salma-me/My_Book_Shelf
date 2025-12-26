import 'package:flutter/material.dart';
import 'package:my_book_shelf/core/utils/styles.dart';

class CustomNoSearchResultsWidget extends StatelessWidget {
  const CustomNoSearchResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('No Results', style: Styles.textStyle20));
  }
}
