import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: const Scaffold(body: SearchViewBody()));
  }
}
