class User {
  final String id;
  int streak;
  final String username;
  String lastLearnAt;
  int exp;

  User(
      {required this.id,
      required this.streak,
      required this.username,
      required this.exp,
      required this.lastLearnAt});

  static User fromJson(Map<dynamic, dynamic> json) {
    dynamic data = json["users"][0];
    return User(
      id: data["id"],
      streak: data["streak"],
      username: data["username"],
      exp: data["exp"],
      lastLearnAt: data["last_learn_at"],
    );
  }
}
