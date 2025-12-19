import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsCustomAppbar extends StatelessWidget {
  const BookDetailsCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.close_rounded,
              size: 32,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 32,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
