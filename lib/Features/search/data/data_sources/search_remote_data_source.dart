import 'package:my_book_shelf/Features/home/domain/entities/book_entity.dart';
import 'package:my_book_shelf/core/utils/api_service.dart';

import '../../../home/data/models/book_model/book_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchResultBooks({
    required String searchQuery,
  });
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchSearchResultBooks({
    required String searchQuery,
  }) async {
    var data = await apiService.get(
      endPoint: 'volumes?q=subject:$searchQuery',
      // 'volumes?q=subject:Programming&filter=free-ebooks',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    if (data['totalItems'] != 0) {
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item as Map<String, dynamic>));
      }
    }
    return books;
  }
}
