class Recipe {
  String id;
  String imageUrl;
  String recipeName;
  String description;
  bool vegetarian;
  String difficulty;
  String madeBy;
  String category;
  String steps;
  String ingredients;
  int calories;

  Recipe(
      {required this.id,
      required this.imageUrl,
      required this.recipeName,
      required this.description,
      required this.vegetarian,
      required this.difficulty,
      required this.madeBy,
      required this.category,
      required this.steps,
      required this.ingredients,
      required this.calories});

  Recipe.fromMap(Map<String, dynamic> snapshot, String id)
      : id = id,
        imageUrl = snapshot['imageUrl'] ?? '',
        recipeName = snapshot['recipeName'] ?? '',
        description = snapshot['description'] ?? '',
        vegetarian = snapshot['vegetarian'] ?? '',
        difficulty = snapshot['difficulty'] ?? '',
        madeBy = snapshot['madeBy'] ?? '',
        category = snapshot['category'] ?? '',
        steps = snapshot['steps'] ?? '',
        ingredients = snapshot['ingredients'] ?? '',
        calories = snapshot['calories'] ?? '';
}
