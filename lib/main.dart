import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_book_shelf/Features/splash/presentation/views/splash_view.dart';
import 'package:my_book_shelf/constants.dart';

void main() {
  runApp(const MyBookShelf());
}

class MyBookShelf extends StatelessWidget {
  const MyBookShelf({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ).copyWith(scaffoldBackgroundColor: kPrimaryColor),
      home: const SplashView(),
    );
  }
}
