import 'package:flutter_test/flutter_test.dart';
import 'package:irestos/store/restaurant/restaurant_store.dart';

void main() {
  late RestaurantStore restaurantStore;

  setUpAll(() {
    restaurantStore = RestaurantStore();
  });

  test('Ensure first restaurant\'s item parsing json was correct', () async {
    final testRestaurantMap = {
      "id": "w7jca3irwykfw1e867",
      "name": "Fairy Cafe",
      "description":
          "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
      "pictureId": "24",
      "city": "Surabaya",
      "rating": 5,
    };

    await restaurantStore.fetchRestaurants();

    final restaurant = restaurantStore.restaurants[0].toMap();
    expect(restaurant, testRestaurantMap);
  });
  test('Ensure total item is 20', () async {
    int total = 20;

    await restaurantStore.fetchRestaurants();

    final result = restaurantStore.restaurants.length;
    expect(result, total);
  });
}