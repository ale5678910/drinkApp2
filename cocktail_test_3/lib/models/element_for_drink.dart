class ElementForCreation {
  final List<DataDrinkElement> categories;
  final List<Language> languages;
  final List<DataDrinkElement> glass;
  final List<DataDrinkElement> ingredients;
  ElementForCreation({
    required this.ingredients,
    required this.categories,
    required this.languages,
    required this.glass,
  });
  factory ElementForCreation.fromJson(Map<String, dynamic> json) {
    return ElementForCreation(
      categories: json['category'] is List
          ? (json['category'] as List).map((e) => DataDrinkElement.fromJson(e)).toList()
          : [],
      languages: json['languages'] is List
          ? (json['languages'] as List)
              .map((e) => Language.fromJson(e))
              .toList()
          : [],
      glass: json['glass'] is List
          ? (json['glass'] as List).map((e) => DataDrinkElement.fromJson(e)).toList()
          : [],
      ingredients: json['ingredient'] is List
          ? (json['ingredient'] as List)
              .map((e) => DataDrinkElement.fromJson(e))
              .toList()
          : [],
    );
  }
}

class DataDrinkElement {
  final int id;
  final String name;

  DataDrinkElement({
    required this.id,
    required this.name,
  });
  factory DataDrinkElement.fromJson(Map<String, dynamic> json) {
    return DataDrinkElement(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Language {
  final int id;
  final String language;

  Language({
    required this.id,
    required this.language,
  });
  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json['id'],
      language: json['language'],
    );
  }
}
