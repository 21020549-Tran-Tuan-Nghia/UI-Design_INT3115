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
    dynamic data = json["users"][0];
    return User(
      id: data["id"],
      streak: data["streak"],
      username: data["username"],
      lastLearnAt: data["last_learn_at"],
    );
  }
}
