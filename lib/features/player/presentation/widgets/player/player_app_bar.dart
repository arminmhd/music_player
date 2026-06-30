import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';

class PlayerAppBar extends StatelessWidget {
  const PlayerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.horizontal,
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            IconButton(onPressed: context.pop, icon: AppIcons.arrowDown),

            const Expanded(
              child: Center(child: AppTextWidget(data: 'Now Playing')),
            ),

            IconButton(onPressed: () {}, icon: AppIcons.more),
          ],
        ),
      ),
    );
  }
}
