/*import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
//import 'package:build_runner/build_runner.dart';

// main.dart

import 'router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(AppRouter()),
      routeInformationParser: AppRouter(),
      debugShowCheckedModeBanner: false,
    );
  }
}*/

import 'package:flutter/material.dart';
/*import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_flutter_hooks/router.gr.dart';
import 'package:flutter_application_flutter_hooks/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
*/

/*part of 'app_router.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LandingPage, initial: true),
    AutoRoute(page: AuthPage),
    AutoRoute(page: InfoDisplayPage, path: '/info'),
  ],
)
class $AppRouter {}*/

/*import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_flutter_hooks/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(_appRouter),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
