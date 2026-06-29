import 'package:flutter/widgets.dart';

abstract final class AppCurves {
  const AppCurves._();

  static const standard = Curves.easeOut;

  static const emphasized = Curves.easeInOutCubic;

  static const decelerate = Curves.easeOut;

  static const accelerate = Curves.easeIn;

  static const bounce = Curves.easeOutBack;

  static const linear = Curves.linear;
}
