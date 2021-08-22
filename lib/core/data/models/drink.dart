class Drink {
  Drink({required this.name});
  final String name;

  factory Drink.fromMap(Map<String, dynamic> map) {
    return Drink(
      name: map['name'],
    );
  }
}
