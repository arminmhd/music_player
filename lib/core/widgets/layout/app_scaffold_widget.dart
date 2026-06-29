import 'package:flutter/material.dart';

class AppScaffoldWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? background;
  final bool resizeToAvoidBottomInset;
  final bool safeArea;
  const AppScaffoldWidget({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.background,
    this.resizeToAvoidBottomInset = true,
    this.safeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = safeArea ? SafeArea(child: body) : body;
    return Scaffold(
      appBar: appBar,
      backgroundColor: background,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      body: content,
    );
  }
}
