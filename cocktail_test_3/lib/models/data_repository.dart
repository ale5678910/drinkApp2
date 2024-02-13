import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'drink.dart';
import 'element_for_drink.dart';

class DataManager {

  DataManager.internal();
  static final DataManager _instance = DataManager.internal();
  factory DataManager() => _instance;

  List<Drink>? drink ;
  ElementForCreation? element;
  DioException? drinkError;
  DioException? elementError;

  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
  ));
  static const baseURL = "http://192.168.178.36:8080/api/drink/getall";
  static const second =
      "http://192.168.178.36:8080/category-glass-ingredient-language";

  Future<List<Drink>> fetchDrink() async {
    try {
      final response = await dio.get(baseURL);
      return Drink.listFromJson(response.data);
    } on DioException catch (e) {
      drinkError = e;
      throw Exception(e.error);
    }
  }

  Future<ElementForCreation> fetchElement() async {
    try {
      final response = await dio.get(second);
      return ElementForCreation.fromJson(response.data);
    } on DioException catch (e) {
      elementError = e;
      throw Exception(e.error);
    }
  }

  void fetch() async{
    drink = await fetchDrink();
  }

}
