class SandboxController {
  static bool _sandbox = false;

  static bool get isSandbox => _sandbox;
  static void setSandbox(bool value) {
    _sandbox = value;
  }
}
