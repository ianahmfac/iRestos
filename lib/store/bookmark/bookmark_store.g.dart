// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BookmarkStore on _BookmarkStore, Store {
  Computed<List<Restaurant>>? _$myBookmarkComputed;

  @override
  List<Restaurant> get myBookmark => (_$myBookmarkComputed ??=
          Computed<List<Restaurant>>(() => super.myBookmark,
              name: '_BookmarkStore.myBookmark'))
      .value;
  Computed<NetworkState>? _$networkStateComputed;

  @override
  NetworkState get networkState => (_$networkStateComputed ??=
          Computed<NetworkState>(() => super.networkState,
              name: '_BookmarkStore.networkState'))
      .value;
  Computed<ListRestaurantState>? _$bookmarkStateComputed;

  @override
  ListRestaurantState get bookmarkState => (_$bookmarkStateComputed ??=
          Computed<ListRestaurantState>(() => super.bookmarkState,
              name: '_BookmarkStore.bookmarkState'))
      .value;

  final _$_bookmarkFutureAtom = Atom(name: '_BookmarkStore._bookmarkFuture');

  @override
  ObservableFuture<List<String>>? get _bookmarkFuture {
    _$_bookmarkFutureAtom.reportRead();
    return super._bookmarkFuture;
  }

  @override
  set _bookmarkFuture(ObservableFuture<List<String>>? value) {
    _$_bookmarkFutureAtom.reportWrite(value, super._bookmarkFuture, () {
      super._bookmarkFuture = value;
    });
  }

  final _$bookmarkRestaurantsAtom =
      Atom(name: '_BookmarkStore.bookmarkRestaurants');

  @override
  ObservableList<String> get bookmarkRestaurants {
    _$bookmarkRestaurantsAtom.reportRead();
    return super.bookmarkRestaurants;
  }

  @override
  set bookmarkRestaurants(ObservableList<String> value) {
    _$bookmarkRestaurantsAtom.reportWrite(value, super.bookmarkRestaurants, () {
      super.bookmarkRestaurants = value;
    });
  }

  final _$messageAtom = Atom(name: '_BookmarkStore.message');

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

  final _$fetchBookmarkAsyncAction =
      AsyncAction('_BookmarkStore.fetchBookmark');

  @override
  Future<void> fetchBookmark() {
    return _$fetchBookmarkAsyncAction.run(() => super.fetchBookmark());
  }

  final _$addBookmarkAsyncAction = AsyncAction('_BookmarkStore.addBookmark');

  @override
  Future<void> addBookmark(String id) {
    return _$addBookmarkAsyncAction.run(() => super.addBookmark(id));
  }

  final _$removeBookmarkAsyncAction =
      AsyncAction('_BookmarkStore.removeBookmark');

  @override
  Future<void> removeBookmark(String id) {
    return _$removeBookmarkAsyncAction.run(() => super.removeBookmark(id));
  }

  @override
  String toString() {
    return '''
bookmarkRestaurants: ${bookmarkRestaurants},
message: ${message},
myBookmark: ${myBookmark},
networkState: ${networkState},
bookmarkState: ${bookmarkState}
    ''';
  }
}
