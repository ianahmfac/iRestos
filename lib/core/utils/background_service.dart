import 'dart:isolate';
import 'dart:ui';

import '../../main.dart';
import '../app/service_locator.dart';
import '../data/api/api_service.dart';
import 'notification_helper.dart';

class BackgroundService {
  BackgroundService._();
  static final instance = BackgroundService._();

  static String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  ReceivePort port = getIt<ReceivePort>();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    final _api = ApiService.instance;
    print('Alarm fired!');
    final NotificationHelper notificationHelper = NotificationHelper.instance;

    final result = await _api.getListRestaurant();
    await notificationHelper.showNotification(
      flutterLocalNotificationsPlugin,
      result,
    );

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }

  Future<void> someTask() async {
    print('Execute some process');
  }
}
