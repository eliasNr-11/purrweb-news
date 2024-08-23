import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:purrweb_news/presentation/screens/home_page.dart';

GoRouter routes() {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
    ],
  );
}
