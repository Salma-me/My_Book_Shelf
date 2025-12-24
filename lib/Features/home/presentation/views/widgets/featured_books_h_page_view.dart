import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_book_shelf/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:my_book_shelf/core/models/book_model/book_model.dart';
import 'package:my_book_shelf/core/widgets/custom_error_widget.dart';
import 'package:my_book_shelf/core/widgets/custom_loading_indicator.dart';

class FeaturedBooksHPageView extends StatefulWidget {
  const FeaturedBooksHPageView({super.key});

  @override
  State<FeaturedBooksHPageView> createState() => _FeaturedBooksHPageViewState();
}

class _FeaturedBooksHPageViewState extends State<FeaturedBooksHPageView> {
  late final PageController _controller;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    initPageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          final List<BookModel> books = state.books;
          return SizedBox(
            // height: 280,
            height: MediaQuery.of(context).size.height * 0.28,
            child: PageView.builder(
              padEnds: false,
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                final imageUrl = book.volumeInfo?.imageLinks?.thumbnail ?? '';
                double scale = getItemScale(index);

                return Transform.scale(
                  scale: scale,
                  child: CustomBookImage(imageUrl: imageUrl),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
        // return const SizedBox();
      },
    );
  }

  void initPageController() {
    _controller = PageController(viewportFraction: 0.45)
      ..addListener(() {
        setState(() {
          _currentPage = _controller.page!;
        });
      });
  }

  double getItemScale(int index) {
    // Get item distance from center
    // Start at scale 1.0
    // Shrink by 0.3 for each step away
    final scale = (1 - (_currentPage - index).abs() * 0.3).clamp(0.8, 1.0);
    return scale;
  }
}
