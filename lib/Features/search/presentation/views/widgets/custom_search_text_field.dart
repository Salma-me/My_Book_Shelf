import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(Colors.white),
        focusedBorder: buildOutlineInputBorder(Colors.blue),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: 0.7,
            child: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}
