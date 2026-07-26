import 'package:hive_ce/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authors;
  @HiveField(4)
  final String price;
  @HiveField(5)
  final String rating;

  const BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authors,
    required this.price,
    required this.rating,
  });
}
