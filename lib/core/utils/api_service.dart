// import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  static String apiKey = dotenv.get('GOOGLE_BOOKS_API_KEY');

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    // debugPrint('$_baseUrl$endPoint&key=$apiKey');
    // debugPrint(apiKey);
    var response = await _dio.get('$_baseUrl$endPoint&key=$apiKey');
    // debugPrint(response.data);
    return response.data;
  }
}
