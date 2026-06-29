import 'package:flutter/material.dart';
import 'package:my_player/core/widgets/app_button_widget.dart';

class ShufflePlayButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool enabled;

  const ShufflePlayButton({super.key, this.onPressed, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return AppButtonWidget(
      text: 'shuffle play',
      icon: Icons.shuffle_rounded,
      onPressed: enabled ? onPressed : null,
    );
  }
}
