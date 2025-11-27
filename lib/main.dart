import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pie_menu/pie_menu.dart';

import 'core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocalizationCubit>(),
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, localizationState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
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
            builder: (context, child) => PieCanvas(
              theme: PieTheme(
                regularPressShowsMenu: true,
                longPressShowsMenu: false,
                brightness: Theme.of(context).brightness,
                pointerSize: 0,
                overlayColor: Colors.black.withValues(alpha: 0.3),
              ),
              child: child ?? const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
