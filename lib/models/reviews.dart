class Reviews {
  String id;
  String recipeName;
  String username;
  String description;
  String imageUrl;
  String userId;

  Reviews(
      {required this.id,
      required this.recipeName,
      required this.username,
      required this.description,
      required this.imageUrl,
      required this.userId});
  factory Reviews.fromMap(Map<String, dynamic> snapshot, String id) => Reviews(
        id: id,
        recipeName: snapshot['recipeName'] ?? '',
        username: snapshot['username'] ?? '',
        description: snapshot['description'] ?? '',
        imageUrl: snapshot['imageUrl'] ?? '',
        userId: snapshot['userId'] ?? '',
      );
}
