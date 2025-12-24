import 'package:flutter/material.dart';
import 'package:my_book_shelf/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMessage, style: Styles.textStyle18));
  }
}
