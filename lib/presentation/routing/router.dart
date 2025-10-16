import 'package:aholic/presentation/pages/edit_event_page.dart';
import 'package:aholic/presentation/pages/edit_timeline_page.dart';
import 'package:aholic/presentation/pages/home_page.dart';
import 'package:aholic/presentation/pages/timelines_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'timelines',
          builder: (context, state) => TimelinesPage(),
          routes: [
            GoRoute(
              path: 'edit',
              builder: (context, state) => EditTimelinePage(),
            ),
          ],
        ),
        GoRoute(
          path: 'events/edit',
          builder: (context, state) => EditEventPage(),
        ),
      ],
    ),
  ],
);
