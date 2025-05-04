import 'package:logger/logger.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class Log {
  static final _logger = Logger();

  /// Log a message at level [Level.t].
  static void t(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  static void d(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  static void i(dynamic message,
      {dynamic error, StackTrace? stackTrace, bool recordMessage = false}) {
    _logger.i(message, error: error, stackTrace: stackTrace);

    if (recordMessage) {
      FirebaseCrashlytics.instance.log(message);
      FirebaseCrashlytics.instance.sendUnsentReports();
    }
  }

  /// Log a message at level [Level.warning].
  static void w(dynamic message,
      {dynamic error, StackTrace? stackTrace, bool recordMessage = false}) {
    _logger.w(message, error: error, stackTrace: stackTrace);

    if (recordMessage) {
      FirebaseCrashlytics.instance.log(message);
      FirebaseCrashlytics.instance.sendUnsentReports();
    }
  }

  /// Log a message at level [Level.error].
  static void e(dynamic message, dynamic error, StackTrace stackTrace,
      {bool recordError = false}) {
    _logger.e(message, error: error, stackTrace: stackTrace);

    if (recordError) {
      FirebaseCrashlytics.instance.log(message);
      FirebaseCrashlytics.instance
          .recordError(error, stackTrace, printDetails: true);
    }
  }

  /// Log a message at level [Level.fatal].
  static void f(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }
}
