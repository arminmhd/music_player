import 'package:flutter/painting.dart';

abstract final class AppShadows {
  const AppShadows._();

  //cards
  static const List<BoxShadow> card = [
    BoxShadow(color: Color(0x14000000), blurRadius: 8, offset: Offset(0, 2)),
  ];

  //floating widgets
  static const List<BoxShadow> floating = [
    BoxShadow(color: Color(0x26000000), blurRadius: 16, offset: Offset(0, 6)),
  ];

  /// Dialogs
  static const List<BoxShadow> dialog = [
    BoxShadow(color: Color(0x33000000), blurRadius: 24, offset: Offset(0, 10)),
  ];

  /// Bottom Sheets
  static const List<BoxShadow> bottomSheet = [
    BoxShadow(color: Color(0x22000000), blurRadius: 20, offset: Offset(0, -4)),
  ];
}
