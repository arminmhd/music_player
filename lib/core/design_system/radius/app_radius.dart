import 'package:flutter/painting.dart';

abstract final class AppRadius {
  const AppRadius._();

  static const double none = 0;

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;

  static const double full = 999;

  static BorderRadius radiusXs = BorderRadius.circular(xs);
  static BorderRadius radiusSm = BorderRadius.circular(sm);
  static BorderRadius radiusMd = BorderRadius.circular(md);
  static BorderRadius radiusLg = BorderRadius.circular(lg);
  static BorderRadius radiusXl = BorderRadius.circular(xl);
  static BorderRadius radiusXxl = BorderRadius.circular(xxl);
  static BorderRadius radiusFull = BorderRadius.circular(full);
}
