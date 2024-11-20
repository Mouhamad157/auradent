class AppConstants {
  static const Duration animationDuration = Duration(milliseconds: 250);

  static Duration animationDurationWithOffset(int offset) =>
      Duration(milliseconds: 250 + offset);
}
