class SandboxController{
  static bool _sandbox = false;

  static void setSandbox(bool value){
    _sandbox = value;
  }

  static bool get isSandbox => _sandbox;
}
