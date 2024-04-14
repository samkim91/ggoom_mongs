import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ggoom_mongs/routes.dart';
import 'package:ggoom_mongs/sources/presentation/providers/dream_provider.dart';
import 'package:ggoom_mongs/sources/presentation/providers/navigation_provider.dart';
import 'package:ggoom_mongs/sources/presentation/screens/main_screen.dart';
import 'package:ggoom_mongs/sources/presentation/screens/record_screen.dart';
import 'package:ggoom_mongs/themes/color_schemes.g.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: mainScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const MainScreen(),
    ),
    GoRoute(
      path: recordScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const RecordScreen(),
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DreamProvider(),
        )
      ],
      child: MaterialApp.router(
        title: AppLocalizations.of(context)?.appName ?? "Ggoom Mongs",
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            iconTheme: IconThemeData(color: lightColorScheme.primary)),
        darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            iconTheme: IconThemeData(color: lightColorScheme.primary)),
        routerConfig: _router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
