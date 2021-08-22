class UserApp {
  final String id;
  final String email;
  final String name;
  UserApp({
    required this.id,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }

  factory UserApp.fromMap(Map<String, dynamic> map) {
    return UserApp(
      id: map['id'],
      email: map['email'],
      name: map['name'],
    );
  }
}
