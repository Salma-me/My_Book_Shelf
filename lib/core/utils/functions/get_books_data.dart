  import 'package:hive_ce/hive.dart';

import '../../../Features/home/domain/entities/book_entity.dart';

List<BookEntity> getBooksData(String boxName) {
    var box = Hive.box<BookEntity>(boxName);
    return box.values.toList();
  }