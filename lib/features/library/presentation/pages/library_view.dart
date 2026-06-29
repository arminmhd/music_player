import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/design_system/spacing/app_insets.dart';
import 'package:my_player/core/design_system/spacing/app_spacing.dart';
import 'package:my_player/core/widgets/app_text_widget.dart';
import 'package:my_player/core/widgets/layout/app_scaffold_widget.dart';
import 'package:my_player/features/library/domain/enum/library_status.dart';
import 'package:my_player/features/library/domain/enum/library_tab.dart';
import 'package:my_player/features/library/presentation/bloc/library_bloc.dart';
import 'package:my_player/features/library/presentation/bloc/library_event.dart';
import 'package:my_player/features/library/presentation/bloc/library_state.dart';
import 'package:my_player/features/library/presentation/widgets/library_app_bar.dart';
import 'package:my_player/features/library/presentation/widgets/library_tab_bar.dart';
import 'package:my_player/features/library/presentation/widgets/library_tab_content.dart';
import 'package:my_player/features/library/presentation/widgets/shuffle_play_button.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      body: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, state) {
          switch (state.status) {
            case LibraryStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case LibraryStatus.error:
              return Center(
                child: AppTextWidget(data: state.message ?? 'Unknown error'),
              );

            case LibraryStatus.loaded:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LibraryAppBar(),

                  AppSpacing.md.verticalSpace,

                  LibraryTabBar(
                    selectedTab: state.selectedTab,
                    onTabSelected: (tab) {
                      context.read<LibraryBloc>().add(
                        ChangeLibraryTabEvent(tab),
                      );
                    },
                  ),

                  AppSpacing.md.verticalSpace,

                  Padding(
                    padding: AppInsets.horizontal,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ShufflePlayButton(
                        enabled:
                            state.selectedTab == LibraryTab.songs &&
                            state.songs.isNotEmpty,
                      ),
                    ),
                  ),

                  AppSpacing.md.verticalSpace,

                  const Expanded(child: LibraryTabContent()),
                ],
              );

            case LibraryStatus.initial:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
