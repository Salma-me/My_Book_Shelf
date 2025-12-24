import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_book_shelf/Features/home/data/repos/home_repo_impl.dart';
import 'package:my_book_shelf/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:my_book_shelf/Features/home/presentation/views/book_details_view.dart';
import 'package:my_book_shelf/Features/home/presentation/views/home_view.dart';
import 'package:my_book_shelf/Features/search/presentation/views/search_view.dart';
import 'package:my_book_shelf/Features/splash/presentation/views/splash_view.dart';
import 'package:my_book_shelf/core/models/book_model/book_model.dart';
import 'package:my_book_shelf/core/utils/service_locator.dart';

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

        builder: (context, state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(book: state.extra as BookModel),
          );
        },
      ),
      GoRoute(path: kSearchViewPath, builder: (context, state) => SearchView()),
    ],
  );
}
