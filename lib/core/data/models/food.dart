class Food {
  Food({required this.name});
  final String name;

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'],
    );
  }
}
