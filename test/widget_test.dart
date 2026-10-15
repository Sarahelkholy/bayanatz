import 'package:bayanatz/core/cubit/locale_cubit.dart';
import 'package:bayanatz/core/cubit/theme_cubit.dart';
import 'package:bayanatz/core/theme/app_theme.dart';
import 'package:bayanatz/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the home screen in English', (tester) async {
    final localeCubit = LocaleCubit()..setLocale(const Locale('en'));
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<LocaleCubit>.value(value: localeCubit),
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        child: const MyApp(),
      ),
    );
  });

  testWidgets('shows the home screen in Arabic', (tester) async {
    final localeCubit = LocaleCubit()..setLocale(const Locale('ar'));
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<LocaleCubit>.value(value: localeCubit),
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        child: const MyApp(),
      ),
    );
  });

  test('provides separate light and dark themes', () {
    expect(AppTheme.lightTheme.brightness, Brightness.light);
    expect(AppTheme.darkTheme.brightness, Brightness.dark);
    expect(
      AppTheme.lightTheme.colorScheme.surface,
      isNot(AppTheme.darkTheme.colorScheme.surface),
    );
  });
}
