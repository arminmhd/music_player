import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get width => screenSize.width;

  double get heigh => screenSize.height;
}
