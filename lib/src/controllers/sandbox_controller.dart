import 'package:flutter/widgets.dart';

/// The sandbox controller, this is used to handle/control the sandbox flag in the SDK.
@immutable
class SandboxController {
  // The private sandbox flag.

  static bool _sandbox = false;

  /// The sandbox flag, if this equals true the SDK will use the sandbox API.
  static bool get isSandbox => _sandbox;
  static void setSandbox(bool value) {
    _sandbox = value;
  }
}
