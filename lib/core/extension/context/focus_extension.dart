import 'package:flutter/material.dart';

extension FocusExtension on BuildContext {
  bool get isKeyboardOpen => MediaQuery.viewInsetsOf(this).bottom > 0;

  void onFocus() {
    FocusScope.of(this).unfocus();
  }
}
