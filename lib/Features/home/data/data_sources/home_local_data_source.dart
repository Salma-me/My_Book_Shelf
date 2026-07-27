import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/constants.dart';

import '../../../../core/utils/functions/get_books_data.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchSimilarBooks({required String category});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    return getBooksData(kFeaturedBox);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    return getBooksData(kNewestBox);
  }

  @override
  List<BookEntity> fetchSimilarBooks({required String category}) {
    return getBooksData(kSimilarBox);
  }
}
