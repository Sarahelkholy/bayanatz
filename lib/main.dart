import 'package:bayanatz/config/di/di.dart';
import 'package:bayanatz/config/route_manager/route_generator.dart';
import 'package:bayanatz/config/route_manager/routes.dart';
import 'package:bayanatz/core/cubit/locale_cubit.dart';
import 'package:bayanatz/core/l10n/generated/app_localizations.dart';
import 'package:bayanatz/core/theme/app_theme.dart';
import 'package:bayanatz/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(
    BlocProvider(
      create: (_) => LocaleCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeRoute,
      onGenerateRoute: RouteGenerator.getRoute,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
