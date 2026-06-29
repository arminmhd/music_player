import 'package:go_router/go_router.dart';
import 'package:my_player/app/router/route_names.dart';
import 'package:my_player/app/router/route_paths.dart';
import 'package:my_player/features/library/presentation/pages/library_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.library,

  routes: [
    GoRoute(
      path: RoutePaths.library,
      name: RouteNames.library,
      builder: (context, state) => const LibraryPage(),
    ),
  ],
);
