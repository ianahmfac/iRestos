import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'config/routes/payload_navigation.dart';
import 'config/routes/routes.dart';
import 'config/theme/theme.dart';
import 'core/app/service_locator.dart';
import 'core/utils/background_service.dart';
import 'core/utils/notification_helper.dart';
import 'pages/navigation_page.dart';
import 'pages/sign_in_page.dart';
import 'store/auth/auth_store.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServiceLocator.setupLocator();

  final _notificationHelper = NotificationHelper.instance;
  final _service = BackgroundService.instance;

  _service.initializeIsolate();
  if (Platform.isAndroid) await AndroidAlarmManager.initialize();
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'iResto\'s',
        theme: myThemeData(),
        navigatorKey: payloadNavigatorKey,
        home: LandingPage(),
        onGenerateRoute: Routes.routeSettings,
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStore = getIt<AuthStore>();
    return Scaffold(
      body: authStore.hasUserLoggedIn() ? NavigationPage() : SignInPage(),
    );
  }
}
