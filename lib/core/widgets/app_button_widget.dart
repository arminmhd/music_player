import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';

class AppButtonWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool expanded;

  const AppButtonWidget({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.enabled = true,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = SizedBox(
      height: 44.h,
      child: FilledButton(
        onPressed: enabled ? onPressed : null,
        style: FilledButton.styleFrom(
          padding: AppInsets.horizontal,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.radiusLg),
        ),
        child: Row(
          mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20.sp),

              SizedBox(width: 8.w),
            ],

            AppTextWidget(data: text, style: context.textTheme.labelLarge),
          ],
        ),
      ),
    );

    if (expanded) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
