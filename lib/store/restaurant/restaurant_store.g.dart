// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantStore on _RestaurantStore, Store {
  Computed<NetworkState>? _$networkStateComputed;

  @override
  NetworkState get networkState => (_$networkStateComputed ??=
          Computed<NetworkState>(() => super.networkState,
              name: '_RestaurantStore.networkState'))
      .value;
  Computed<ListRestaurantState>? _$restaurantsStateComputed;

  @override
  ListRestaurantState get restaurantsState => (_$restaurantsStateComputed ??=
          Computed<ListRestaurantState>(() => super.restaurantsState,
              name: '_RestaurantStore.restaurantsState'))
      .value;

  final _$_restaurantsFutureAtom =
      Atom(name: '_RestaurantStore._restaurantsFuture');

  @override
  ObservableFuture<List<Restaurant>>? get _restaurantsFuture {
    _$_restaurantsFutureAtom.reportRead();
    return super._restaurantsFuture;
  }

  @override
  set _restaurantsFuture(ObservableFuture<List<Restaurant>>? value) {
    _$_restaurantsFutureAtom.reportWrite(value, super._restaurantsFuture, () {
      super._restaurantsFuture = value;
    });
  }

  final _$restaurantsAtom = Atom(name: '_RestaurantStore.restaurants');

  @override
  ObservableList<Restaurant> get restaurants {
    _$restaurantsAtom.reportRead();
    return super.restaurants;
  }

  @override
  set restaurants(ObservableList<Restaurant> value) {
    _$restaurantsAtom.reportWrite(value, super.restaurants, () {
      super.restaurants = value;
    });
  }

  final _$messageAtom = Atom(name: '_RestaurantStore.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$fetchRestaurantsAsyncAction =
      AsyncAction('_RestaurantStore.fetchRestaurants');

  @override
  Future<void> fetchRestaurants() {
    return _$fetchRestaurantsAsyncAction.run(() => super.fetchRestaurants());
  }

  @override
  String toString() {
    return '''
restaurants: ${restaurants},
message: ${message},
networkState: ${networkState},
restaurantsState: ${restaurantsState}
    ''';
  }
}
