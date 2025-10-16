import 'dart:ui';

import 'package:aholic/presentation/routing/router.dart';
import 'package:aholic/presentation/theme/ahl_theme.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

class AhlApp extends StatelessWidget {
  const AhlApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aholic',
      theme: ahlTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
