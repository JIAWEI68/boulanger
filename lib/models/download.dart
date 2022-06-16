class Download {
  String imageUrl;
  String recipeName;
  String description;
  bool vegetarian;
  String difficulty;
  String madeBy;
  String steps;
  String ingredients;
  int calories;

  Download(
      {required this.imageUrl,
      required this.recipeName,
      required this.description,
      required this.vegetarian,
      required this.difficulty,
      required this.madeBy,
      required this.steps,
      required this.ingredients,
      required this.calories});
}
