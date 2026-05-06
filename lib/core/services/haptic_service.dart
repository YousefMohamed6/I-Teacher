import 'package:flutter/services.dart';

class HapticService {
  /// Provides a light tactile feedback for general interactions.
  static Future<void> light() async {
    await HapticFeedback.lightImpact();
  }

  /// Provides a medium tactile feedback for standard notifications.
  static Future<void> medium() async {
    await HapticFeedback.mediumImpact();
  }

  /// Provides a heavy tactile feedback for critical alerts or errors.
  static Future<void> heavy() async {
    await HapticFeedback.heavyImpact();
  }

  /// Specialized pattern for a new message (Short-Long-Short).
  static Future<void> newMessagePattern() async {
    await HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 100));
    await HapticFeedback.mediumImpact();
    await Future.delayed(const Duration(milliseconds: 200));
    await HapticFeedback.lightImpact();
  }

  /// Specialized pattern for a successful action (Double Tap).
  static Future<void> successPattern() async {
    await HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 100));
    await HapticFeedback.lightImpact();
  }

  /// Specialized pattern for a failure or alert (Vibrate).
  static Future<void> alertPattern() async {
    await HapticFeedback.vibrate();
  }
}
