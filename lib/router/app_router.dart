import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inertia/screens/screens.dart';

class AppRouter {
  AppRouter._();

  static GoRouter config = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
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
