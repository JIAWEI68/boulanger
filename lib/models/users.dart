class Users {
  String id;
  String username;
  String firstName;
  String lastName;
  String email;
  String password;

  Users({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory Users.fromMap(Map<String, dynamic> snapshot, String id) => Users(
        id: id,
        username: snapshot['username'] ?? '',
        firstName: snapshot['firstName'] ?? '',
        lastName: snapshot['lastName'] ?? '',
        email: snapshot['email'] ?? '',
        password: snapshot['password'] ?? '',
      );
}
