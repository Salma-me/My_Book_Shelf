import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_book_shelf/Features/home/data/repos/home_repo_impl.dart';
import 'package:my_book_shelf/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_book_shelf/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_book_shelf/constants.dart';
import 'package:my_book_shelf/core/utils/app_router.dart';
import 'package:my_book_shelf/core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyBookShelf());
}

class MyBookShelf extends StatelessWidget {
  const MyBookShelf({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark).copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
