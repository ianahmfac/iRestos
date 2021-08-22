import 'category.dart';
import 'menus.dart';
import 'review.dart';

class RestaurantDetail {
  final String address;
  final List<Category> categories;
  final Menus menus;
  final List<Review> customerReviews;
  RestaurantDetail({
    required this.address,
    required this.categories,
    required this.menus,
    required this.customerReviews,
  });

  factory RestaurantDetail.fromMap(Map<String, dynamic> map) {
    return RestaurantDetail(
      address: map['address'],
      categories: List<Category>.from(
          map['categories']?.map((x) => Category.fromMap(x))),
      menus: Menus.fromMap(map['menus']),
      customerReviews: List<Review>.from(
          map['customerReviews']?.map((x) => Review.fromMap(x))),
    );
  }
}
