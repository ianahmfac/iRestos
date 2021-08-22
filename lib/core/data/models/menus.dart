import 'drink.dart';
import 'food.dart';

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });
  final List<Food> foods;
  final List<Drink> drinks;

  factory Menus.fromMap(Map<String, dynamic> map) {
    return Menus(
      foods: List<Food>.from(map['foods'].map((x) => Food.fromMap(x))),
      drinks: List<Drink>.from(map['drinks'].map((x) => Drink.fromMap(x))),
    );
  }
}
