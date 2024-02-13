import 'dart:ffi';

class Drink {
  final int id;
  final String name;
  final bool alcoholic;
  final String glass;
  final String category;
  final String urlThumb;
  final List<Ingredient> ingredients;
  final List<Instruction> instructions;

  Drink({
    required this.ingredients,
    required this.id,
    required this.name,
    required this.alcoholic,
    required this.glass,
    required this.category,
    required this.urlThumb,
    required this.instructions,
  });
  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      id: json['id'],
      name: json['name'],
      alcoholic: json['alcoholic'] ?? true,
      glass: json['glass'],
      category: json['category'],
      urlThumb: json['url_thumb'],
      ingredients: json['ingredients'] is List
          ? (json['ingredients'] as List)
              .map((e) => Ingredient.fromJson(e))
              .toList()
          : [],
      instructions: json['instructions'] is List
          ? (json['instructions'] as List)
              .map((e) => Instruction.fromJson(e))
              .toList()
          : [],
    );
  }
  static List<Drink> listFromJson(List<dynamic> list) =>
      List<Drink>.from(list.map((e) => Drink.fromJson(e)));
}

class Ingredient {
  String name;
  String measure;

  Ingredient({
    required this.name,
    required this.measure,
  });
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      measure: json['measure'],
    );
  }
}

class Instruction {
  String language;
  String text;

  Instruction({
    required this.language,
    required this.text,
  });
  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(
      language: json['language'] ?? '',
      text: json['text'] ?? '',
    );
  }
}
