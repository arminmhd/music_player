abstract final class AppDurations {
  const AppDurations._();

  static const instant = Duration(milliseconds: 0);

  static const fast = Duration(milliseconds: 150);

  static const normal = Duration(milliseconds: 250);

  static const medium = Duration(milliseconds: 350);

  static const slow = Duration(milliseconds: 500);

  static const verySlow = Duration(milliseconds: 700);
}
