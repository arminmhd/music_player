import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  const AppTextWidget({
    super.key,
    required this.data,
    this.style,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
