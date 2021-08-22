import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:mobx/mobx.dart';

import '../../core/constants/enum.dart';
import '../../core/data/preferences/app_preferences.dart';
import '../../core/utils/background_service.dart';
import '../../core/utils/date_time_helper.dart';

part 'scheduling_store.g.dart';

class SchedulingStore = _SchedulingStore with _$SchedulingStore;

abstract class _SchedulingStore with Store {
  final appPreferences = AppPreferences.instance;

  @observable
  ObservableFuture<bool>? _future;
  @observable
  bool isScheduled = false;
  @observable
  String subtitle = '';

  @computed
  NetworkState get networkState {
    if (_future?.status == FutureStatus.fulfilled) return NetworkState.Loaded;
    return _future?.status == FutureStatus.rejected
        ? NetworkState.Error
        : NetworkState.Initialize;
  }

  @action
  Future<void> fetchScheduling() async {
    _future = ObservableFuture(appPreferences.isNotificationActive);
    isScheduled = await _future ?? false;
  }

  @action
  Future<bool> setNotification(bool value) async {
    appPreferences.setNotificationActive(value);
    isScheduled = value;
    if (isScheduled) {
      print('Notification actived');
      subtitle = 'Every 11:00 AM';
      return await AndroidAlarmManager.periodic(
        Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    }
    print('Notification canceled');
    subtitle = '';
    return await AndroidAlarmManager.cancel(1);
  }
}
