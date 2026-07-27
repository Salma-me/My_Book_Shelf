import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/featured_books_h_list_view.dart';
import 'package:my_book_shelf/core/widgets/custom_error_widget.dart';
import 'package:my_book_shelf/core/widgets/custom_loading_indicator.dart';

class FeaturedBooksHListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksHListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return FeaturedBooksHListView(
            deviceHeight: deviceHeight,
            books: state.books,
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
