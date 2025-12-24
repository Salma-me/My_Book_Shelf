import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_book_shelf/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:my_book_shelf/core/utils/app_router.dart';
import 'package:my_book_shelf/core/widgets/custom_error_widget.dart';
import 'package:my_book_shelf/core/widgets/custom_loading_indicator.dart';

class FeaturedBooksHListView extends StatelessWidget {
  const FeaturedBooksHListView({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: deviceHeight * 0.12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: SizedBox(
                    height: deviceHeight * 0.11,
                    width: MediaQuery.of(context).size.width * 0.17,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kBookDetailsViewPath,
                          extra: state.books[index],
                        );
                      },
                      child: CustomBookImage(
                        imageUrl:
                            state
                                .books[index]
                                .volumeInfo
                                ?.imageLinks
                                ?.thumbnail ??
                            '',
                      ),
                    ),
                  ),
                );
              },
            ),
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
