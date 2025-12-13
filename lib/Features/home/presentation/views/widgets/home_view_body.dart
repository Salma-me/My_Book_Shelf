import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      CustomAppBar(),
      
    ]);
  }
}
