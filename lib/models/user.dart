class User {
  final String id;
  int streak;
  final String username;
  final String lastLearnAt;

  User(
      {required this.id,
      required this.streak,
      required this.username,
      required this.lastLearnAt});

  static User fromJson(Map<dynamic, dynamic> json) {
    return User(
      id: json["id"],
      streak: json["streak"],
      username: json["username"],
      lastLearnAt: json["last_learn_at"],
    );
  }
}
