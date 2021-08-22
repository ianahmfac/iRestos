// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailStore on _DetailStore, Store {
  Computed<NetworkState>? _$networkStateComputed;

  @override
  NetworkState get networkState => (_$networkStateComputed ??=
          Computed<NetworkState>(() => super.networkState,
              name: '_DetailStore.networkState'))
      .value;

  final _$_detailFutureAtom = Atom(name: '_DetailStore._detailFuture');

  @override
  ObservableFuture<RestaurantDetail>? get _detailFuture {
    _$_detailFutureAtom.reportRead();
    return super._detailFuture;
  }

  @override
  set _detailFuture(ObservableFuture<RestaurantDetail>? value) {
    _$_detailFutureAtom.reportWrite(value, super._detailFuture, () {
      super._detailFuture = value;
    });
  }

  final _$restaurantDetailAtom = Atom(name: '_DetailStore.restaurantDetail');

  @override
  RestaurantDetail? get restaurantDetail {
    _$restaurantDetailAtom.reportRead();
    return super.restaurantDetail;
  }

  @override
  set restaurantDetail(RestaurantDetail? value) {
    _$restaurantDetailAtom.reportWrite(value, super.restaurantDetail, () {
      super.restaurantDetail = value;
    });
  }

  final _$messageAtom = Atom(name: '_DetailStore.message');

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

  final _$fetchDetailRestaurantAsyncAction =
      AsyncAction('_DetailStore.fetchDetailRestaurant');

  @override
  Future<void> fetchDetailRestaurant(String id) {
    return _$fetchDetailRestaurantAsyncAction
        .run(() => super.fetchDetailRestaurant(id));
  }

  @override
  String toString() {
    return '''
restaurantDetail: ${restaurantDetail},
message: ${message},
networkState: ${networkState}
    ''';
  }
}
