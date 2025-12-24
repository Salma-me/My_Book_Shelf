import 'package:flutter/material.dart';

void customShowSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}