import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:my_book_shelf/Features/home/data/repos/home_repo_impl.dart';
import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:my_book_shelf/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:my_book_shelf/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_book_shelf/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_book_shelf/app_theme.dart';
import 'package:my_book_shelf/constants.dart';
import 'package:my_book_shelf/core/utils/app_router.dart';
import 'package:my_book_shelf/core/utils/service_locator.dart';
import 'package:my_book_shelf/core/utils/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  runApp(const MyBookShelf());
}

Future<void> _initializeApp() async {
  setupServiceLocator();
  await dotenv.load();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSimilarBox);
  Bloc.observer = SimpleBlocObserver();
}

class MyBookShelf extends StatelessWidget {
  const MyBookShelf({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestdBooksUseCase(getIt.get<HomeRepoImpl>()),
          )..fetchNewestBooks(),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
      ),
    );
  }
}
