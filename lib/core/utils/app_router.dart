import 'package:go_router/go_router.dart';
import 'package:my_book_shelf/Features/home/presentation/views/book_details_view.dart';
import 'package:my_book_shelf/Features/home/presentation/views/home_view.dart';
import 'package:my_book_shelf/Features/search/presentation/views/search_view.dart';
import 'package:my_book_shelf/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeViewPath = '/homeView';
  static const kBookDetailsViewPath = '/bookDetailsView';
  static const kSearchViewPath = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kHomeViewPath, builder: (context, state) => HomeView()),
      GoRoute(
        path: kBookDetailsViewPath,
        builder: (context, state) => BookDetailsView(),
      ),
      GoRoute(path: kSearchViewPath, builder: (context, state) => SearchView()),
    ],
  );
}
