import 'package:bayanatz/config/di/di.dart';
import 'package:bayanatz/config/route_manager/routes.dart';
import 'package:bayanatz/core/l10n/generated/app_localizations.dart';
import 'package:bayanatz/features/home/presentation/cubit/home_cubit.dart';
import 'package:bayanatz/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Keep your original imports
// Make sure to import your cubit and dependency injection (e.g., getIt):
// import 'package:bayanatz/features/home/presentation/cubit/home_cubit.dart';
// import 'package:bayanatz/core/services/service_locator.dart';

abstract class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case Routes.homeRoute:
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => getIt<HomeCubit>()..loadDashboards(),
              child: const HomeScreen(),
            ),
          );

        /// Default
        default:
          return _errorRoute();
      }
    } catch (e, stackTrace) {
      debugPrint("Route error: $e");
      debugPrint("$stackTrace");

      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            AppLocalizations.of(context)!.pageNotFound,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
