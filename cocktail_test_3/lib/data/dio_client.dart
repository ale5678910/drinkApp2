import 'package:cocktail_test_3/models/element_for_drink.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/drink.dart';

class DioClient {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
  ));
  static const baseURL = "http://192.168.178.36:8080/api/drink/getall";
  static const second = "http://192.168.178.36:8080/category-glass-ingredient-language";

  Future<List<Drink>> fetchDrink() async {
    try {
      final response = await dio.get(baseURL);
      return Drink.listFromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.response?.statusCode.toString());
      throw Exception("nbnbn");
    }
  }
  Future<ElementForCreation> fetchElement() async {
    try {
      final response = await dio.get(second);
      return ElementForCreation.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.response?.statusCode.toString());
      throw Exception("nbnbn");
    }
  }
}
