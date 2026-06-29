import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/design_system/sizes/app_sizes.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: AppIcons.shuffle,
            iconSize: AppSizes.iconMd,
          ),
          IconButton(
            onPressed: () {},
            icon: AppIcons.previous,
            iconSize: AppSizes.iconMd,
          ),
          IconButton(
            onPressed: () {},
            icon: AppIcons.play,
            iconSize: AppSizes.iconLg,
          ),
          IconButton(
            onPressed: () {},
            icon: AppIcons.next,
            iconSize: AppSizes.iconMd,
          ),
          IconButton(
            onPressed: () {},
            icon: AppIcons.repeat,
            iconSize: AppSizes.iconMd,
          ),
        ],
      ),
    );
  }
}
