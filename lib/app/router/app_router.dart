import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_player/app/navigation/app_shell_page.dart';
import 'package:my_player/app/navigation/bloc/bottom_nav_bloc.dart';
import 'package:my_player/app/router/route_names.dart';
import 'package:my_player/app/router/route_paths.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.shell,

  routes: [
    GoRoute(
      path: RoutePaths.shell,
      name: RouteNames.shell,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => BottomNavBloc(),
          child: const AppShell(),
        );
      },
    ),
  ],
);
