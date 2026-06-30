import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';
import 'package:my_player/core/util/formatter/duration_formatter.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';

class PlayerSlider extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;

  const PlayerSlider({
    super.key,
    required this.position,
    required this.duration,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final max = duration.inMilliseconds.toDouble();

    final value = position.inMilliseconds
        .toDouble()
        .clamp(0.0, max == 0 ? 1.0 : max)
        .toDouble();

    return Column(
      children: [
        Slider(
          value: value,
          min: 0,
          max: max == 0 ? 1 : max,

          onChanged: (newValue) {
            onChanged?.call(Duration(milliseconds: newValue.toInt()));
          },
        ),

        Padding(
          padding: AppInsets.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextWidget(
                data: DurationFormatter.formatSongForPlayer(position),
              ),
              AppTextWidget(
                data: DurationFormatter.formatSongForPlayer(duration),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
