import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_book_shelf/constants.dart';
import 'package:my_book_shelf/core/utils/app_router.dart';

void main() {
  runApp(const MyBookShelf());
}

class MyBookShelf extends StatelessWidget {
  const MyBookShelf({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark).copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
