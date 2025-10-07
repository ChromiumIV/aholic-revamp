import 'package:aholic/presentation/pages/edit_timeline_page.dart';
import 'package:aholic/presentation/pages/home_page.dart';
import 'package:aholic/presentation/pages/timeline_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'timeline',
          builder: (context, state) => TimelinePage(),
          routes: [
            GoRoute(
              path: 'edit',
              builder: (context, state) => EditTimelinePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
