import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inertia/router/routes.dart';
import 'package:inertia/screens/home/home_screen.dart';

class AppRouter {
  AppRouter._();

  static GoRouter config = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        // routes: <RouteBase>[
        //   GoRoute(
        //     path: 'details',
        //     builder: (BuildContext context, GoRouterState state) {
        //       return const DetailsScreen();
        //     },
        //   ),
        // ],
      ),
    ],
  );
}
