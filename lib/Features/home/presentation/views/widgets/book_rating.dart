import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F), size: 14),
        SizedBox(width: 6.3),
        Text('4.8 ', style: Styles.textStyle16),
        Text(
          '(2390)',
          style: Styles.textStyle14.copyWith(
            color: Colors.white.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
