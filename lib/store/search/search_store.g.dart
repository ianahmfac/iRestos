// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  Computed<NetworkState>? _$networkStateComputed;

  @override
  NetworkState get networkState => (_$networkStateComputed ??=
          Computed<NetworkState>(() => super.networkState,
              name: '_SearchStore.networkState'))
      .value;

  final _$_futureAtom = Atom(name: '_SearchStore._future');

  @override
  ObservableFuture<List<Restaurant>>? get _future {
    _$_futureAtom.reportRead();
    return super._future;
  }

  @override
  set _future(ObservableFuture<List<Restaurant>>? value) {
    _$_futureAtom.reportWrite(value, super._future, () {
      super._future = value;
    });
  }

  final _$restaurantsAtom = Atom(name: '_SearchStore.restaurants');

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

  final _$messageAtom = Atom(name: '_SearchStore.message');

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

  final _$fetchSearchListAsyncAction =
      AsyncAction('_SearchStore.fetchSearchList');

  @override
  Future<void> fetchSearchList(String query) {
    return _$fetchSearchListAsyncAction.run(() => super.fetchSearchList(query));
  }

  @override
  String toString() {
    return '''
restaurants: ${restaurants},
message: ${message},
networkState: ${networkState}
    ''';
  }
}
