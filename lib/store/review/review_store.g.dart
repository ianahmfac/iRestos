// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReviewStore on _ReviewStore, Store {
  Computed<NetworkState>? _$networkStateComputed;

  @override
  NetworkState get networkState => (_$networkStateComputed ??=
          Computed<NetworkState>(() => super.networkState,
              name: '_ReviewStore.networkState'))
      .value;

  final _$_futureAtom = Atom(name: '_ReviewStore._future');

  @override
  ObservableFuture<bool>? get _future {
    _$_futureAtom.reportRead();
    return super._future;
  }

  @override
  set _future(ObservableFuture<bool>? value) {
    _$_futureAtom.reportWrite(value, super._future, () {
      super._future = value;
    });
  }

  final _$isCompleteAtom = Atom(name: '_ReviewStore.isComplete');

  @override
  bool get isComplete {
    _$isCompleteAtom.reportRead();
    return super.isComplete;
  }

  @override
  set isComplete(bool value) {
    _$isCompleteAtom.reportWrite(value, super.isComplete, () {
      super.isComplete = value;
    });
  }

  final _$messageAtom = Atom(name: '_ReviewStore.message');

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

  final _$postReviewAsyncAction = AsyncAction('_ReviewStore.postReview');

  @override
  Future<void> postReview(String id) {
    return _$postReviewAsyncAction.run(() => super.postReview(id));
  }

  final _$_ReviewStoreActionController = ActionController(name: '_ReviewStore');

  @override
  void setName(String? value) {
    final _$actionInfo = _$_ReviewStoreActionController.startAction(
        name: '_ReviewStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ReviewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReview(String? value) {
    final _$actionInfo = _$_ReviewStoreActionController.startAction(
        name: '_ReviewStore.setReview');
    try {
      return super.setReview(value);
    } finally {
      _$_ReviewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateForm(String? value) {
    final _$actionInfo = _$_ReviewStoreActionController.startAction(
        name: '_ReviewStore.validateForm');
    try {
      return super.validateForm(value);
    } finally {
      _$_ReviewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isComplete: ${isComplete},
message: ${message},
networkState: ${networkState}
    ''';
  }
}
