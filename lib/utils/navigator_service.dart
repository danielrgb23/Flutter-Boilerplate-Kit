import 'package:flutter/material.dart';

class NavigatorService {
  static final _navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState? get state {
    return _navigatorKey.currentState;
  }

  static GlobalKey<NavigatorState> get key {
    return _navigatorKey;
  }

  static bool isCurrentRoute(BuildContext context) {
    try {
      return ModalRoute.of(context)!.isCurrent;
    } catch (error, stack) {
      return true;
    }
  }
}