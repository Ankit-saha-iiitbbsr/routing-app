/*import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_flutter_hooks/pages.dart';

//part 'router.gr.dart';

import 'pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LandingPage, initial: true),
    AutoRoute(
      path: '/auth',
      page: AuthPage,
      children: [
        AutoRoute(path: '/info', page: InfoDisplayPage),
      ],
    ),
  ],
)

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // Define your routes here
    AutoRoute(page: LandingPage, initial: true),
    AutoRoute(page: AuthPage),
    AutoRoute(page: InfoDisplayPage),
  ],
)
class $AppRouter {}

part 'router.gr.dart';*/

// router.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_flutter_hooks/pages.dart';

part of 'app_router.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LandingPage, initial: true),
    AutoRoute(page: AuthPage),
    AutoRoute(page: InfoDisplayPage, path: '/info'),
  ],
)
class $AppRouter {}





