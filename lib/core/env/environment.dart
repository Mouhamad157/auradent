import '../enums/env.dart';
export '../enums/env.dart';

class Environment {

  static const Env _env = Env.DEVELOPER;

  /// Use this value to allow loader to close or not by click on back button
  /// When value is [false] the loader will not close manually
  static bool get closeLoader => _env == Env.DEVELOPER;

  /// Use this value to navigate to home without check user status
  static bool get navigateToHome => _env == Env.DEVELOPER;

  static bool get initScreen => _env == Env.DEVELOPER;

}