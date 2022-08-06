class Recipe {
  String id;
  String imageUrl;
  String recipeName;
  String description;
  String vegetarian;
  String difficulty;
  String madeBy;
  String userId;
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
      required this.userId,
      required this.steps,
      required this.ingredients,
      required this.calories});

  factory Recipe.fromMap(Map<String, dynamic> snapshot, String id) => Recipe(
        id: id,
        imageUrl: snapshot['imageUrl'] ?? '',
        recipeName: snapshot['recipeName'] ?? '',
        description: snapshot['description'] ?? '',
        vegetarian: snapshot['vegetarian'] ?? '',
        difficulty: snapshot['difficulty'] ?? '',
        madeBy: snapshot['madeBy'] ?? '',
        userId: snapshot['userId'] ?? '',
        steps: snapshot['steps'] ?? '',
        ingredients: snapshot['ingredients'] ?? '',
        calories: snapshot['calories'] ?? '',
      );
}
