import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/design_system/animations/app_curves.dart';
import 'package:my_player/core/design_system/animations/app_durations.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';
import 'package:my_player/core/design_system/spacing/app_spacing.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';
import 'package:my_player/features/library/domain/enum/library_tab.dart';

class LibraryTabBar extends StatelessWidget {
  final LibraryTab selectedTab;
  final ValueChanged<LibraryTab> onTabSelected;
  const LibraryTabBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: ListView.separated(
        padding: AppInsets.horizontal,
        scrollDirection: Axis.horizontal,
        itemCount: LibraryTab.values.length,
        separatorBuilder: (_, _) => AppSpacing.sm.horizontalSpace,
        itemBuilder: (context, index) {
          final tab = LibraryTab.values[index];
          final isSelected = tab == selectedTab;
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onTabSelected(tab),
              child: AnimatedContainer(
                duration: AppDurations.normal,
                padding: AppInsets.listItem,
                curve: AppCurves.standard,
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colors.secondary
                      : Colors.transparent,
                  borderRadius: AppRadius.radiusMd,
                ),
                child: AppTextWidget(
                  data: tab.title,
                  style: context.textTheme.labelMedium,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
