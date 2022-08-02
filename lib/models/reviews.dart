class Reviews {
  String id;
  String recipeName;
  String username;
  String description;

  Reviews(
      {required this.id,
      required this.recipeName,
      required this.username,
      required this.description});
  factory Reviews.fromMap(Map<String, dynamic> snapshot, String id) => Reviews(
        id: id,
        recipeName: snapshot['recipeName'] ?? '',
        username: snapshot['username'] ?? '',
        description: snapshot['description'] ?? '',
      );
}
