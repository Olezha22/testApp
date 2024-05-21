import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_app/features/home/cubit/localization_cubit.dart';
import 'package:test_app/features/home/home_screen.dart';
import 'package:test_app/features/stop_watch/cubit/stop_watch_cubit.dart';
import 'package:test_app/generated/l10n.dart';
import 'package:test_app/routes/test_app_routes.dart';
import 'package:test_app/themes/test_app_theme.dart';


final GlobalKey<NavigatorState> testAppNavigatorKey =
    GlobalKey<NavigatorState>();

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StopWatchCubit(),
        ),
        BlocProvider(
          create: (context) => LocalizationCubit(),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: locale,
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: testAppTheme,
            routes: testAppRoutes,
            navigatorKey: testAppNavigatorKey,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

