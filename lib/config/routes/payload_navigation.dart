import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> payloadNavigatorKey =
    GlobalKey<NavigatorState>();

class PayloadNavigation {
  static intentWithData(String routeName, Object arguments) {
    payloadNavigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static back() => payloadNavigatorKey.currentState?.pop();
}
