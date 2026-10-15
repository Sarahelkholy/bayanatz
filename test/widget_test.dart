import 'package:bayanatz/core/theme/app_theme.dart';
import 'package:bayanatz/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the home screen in English', (tester) async {
    await tester.pumpWidget(const MyApp(locale: Locale('en')));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Welcome to Bayanatz!'), findsOneWidget);
  });

  testWidgets('shows the home screen in Arabic', (tester) async {
    await tester.pumpWidget(const MyApp(locale: Locale('ar')));
    await tester.pumpAndSettle();

    expect(find.text('الرئيسية'), findsOneWidget);
    expect(find.text('مرحبًا بك في بيانات!'), findsOneWidget);
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
