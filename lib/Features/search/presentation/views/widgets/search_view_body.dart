import 'package:flutter/material.dart';
import 'package:my_book_shelf/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:my_book_shelf/Features/search/presentation/views/widgets/search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(height: 16),

          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
