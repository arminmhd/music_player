import 'package:flutter/material.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';

class AppListTileWidget extends StatelessWidget {
  const AppListTileWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: AppInsets.listItem,
        child: Row(
          children: [
            leading,

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title, const SizedBox(height: 4), subtitle],
              ),
            ),

            ?trailing,
          ],
        ),
      ),
    );
  }
}
