import 'package:flutter/material.dart';
import 'package:my_book_shelf/core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.logo),
        SizedBox(height: 4),
        Text('Read Free Books...', textAlign: TextAlign.center),
      ],
    );
  }
}
