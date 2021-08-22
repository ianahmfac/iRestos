// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduling_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SchedulingStore on _SchedulingStore, Store {
  Computed<NetworkState>? _$networkStateComputed;

  @override
  NetworkState get networkState => (_$networkStateComputed ??=
          Computed<NetworkState>(() => super.networkState,
              name: '_SchedulingStore.networkState'))
      .value;

  final _$_futureAtom = Atom(name: '_SchedulingStore._future');

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

  final _$isScheduledAtom = Atom(name: '_SchedulingStore.isScheduled');

  @override
  bool get isScheduled {
    _$isScheduledAtom.reportRead();
    return super.isScheduled;
  }

  @override
  set isScheduled(bool value) {
    _$isScheduledAtom.reportWrite(value, super.isScheduled, () {
      super.isScheduled = value;
    });
  }

  final _$subtitleAtom = Atom(name: '_SchedulingStore.subtitle');

  @override
  String get subtitle {
    _$subtitleAtom.reportRead();
    return super.subtitle;
  }

  @override
  set subtitle(String value) {
    _$subtitleAtom.reportWrite(value, super.subtitle, () {
      super.subtitle = value;
    });
  }

  final _$fetchSchedulingAsyncAction =
      AsyncAction('_SchedulingStore.fetchScheduling');

  @override
  Future<void> fetchScheduling() {
    return _$fetchSchedulingAsyncAction.run(() => super.fetchScheduling());
  }

  final _$setNotificationAsyncAction =
      AsyncAction('_SchedulingStore.setNotification');

  @override
  Future<bool> setNotification(bool value) {
    return _$setNotificationAsyncAction.run(() => super.setNotification(value));
  }

  @override
  String toString() {
    return '''
isScheduled: ${isScheduled},
subtitle: ${subtitle},
networkState: ${networkState}
    ''';
  }
}
