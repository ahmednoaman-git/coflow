import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pie_menu/pie_menu.dart';

import 'core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Loads date symbols for every locale — `DateFormat` throws for anything but
  // en_US without it, which would break any Arabic date/time formatting.
  await initializeDateFormatting();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
  );

  // Configure dependency injection
  await configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final AppRouter appRouter = AppRouter();

  /// Keeps system Back routed to Flutter, whatever the navigators report.
  ///
  /// With Android's predictive back (on by default from API 36), the engine
  /// only forwards Back while the framework claims it; otherwise Android
  /// finishes the activity itself. Flutter's default claims it only when the
  /// last `NavigationNotification` said something can pop — but every tab of
  /// the `AutoTabsRouter` keeps its nested navigator mounted, and an inactive
  /// tab sitting at its root reports "cannot pop" whenever auto_route rebuilds
  /// its pages. That report, arriving after the active tab's, told Android to
  /// close the app from a pushed facility page, and from a non-Home tab's root
  /// where Back should return to Home.
  ///
  /// auto_route already decides every Back press — pop the active stack, fall
  /// back to the Home tab, or pop the app when nothing is left — so Flutter
  /// always takes it. The cost is Android's home-screen peek at the true root;
  /// leaving the app still works.
  static bool _claimSystemBack(NavigationNotification notification) {
    // Same guard as Flutter's default: the engine is not ready while detached.
    final lifecycle = WidgetsBinding.instance.lifecycleState;
    if (lifecycle != null && lifecycle != AppLifecycleState.detached) {
      SystemNavigator.setFrameworkHandlesBack(true);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocalizationCubit>(),
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, localizationState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            onNavigationNotification: _claimSystemBack,
            // Localization
            locale: localizationState.locale,
            localizationsDelegates: LocalizationManager.localizationsDelegates,
            supportedLocales: LocalizationManager.supportedLocales,
            // Theme
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            // Routing
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            builder: (context, child) => SnackbarHost(
              child: PieCanvas(
                theme: PieTheme(
                  regularPressShowsMenu: true,
                  longPressShowsMenu: false,
                  brightness: Theme.of(context).brightness,
                  pointerSize: 0,
                  overlayColor: Colors.black.withValues(alpha: 0.3),
                ),
                child: child ?? const SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }
}
