import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get lightTheme => _buildTheme(Brightness.light);
  static ThemeData get darkTheme => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: brightness,
        ).copyWith(
          primary: AppColors.primaryColor,
          onPrimary: AppColors.buttonTextOnPrimary,
          primaryContainer: AppColors.lightPink,
          onPrimaryContainer: AppColors.primaryColor,
          surface: isLight ? AppColors.background : AppColors.darkBase,
          onSurface: isLight ? AppColors.textDark : AppColors.darkShade7,
          surfaceContainer: isLight ? AppColors.white : AppColors.darkShade1,
          surfaceContainerHighest: isLight
              ? AppColors.white
              : AppColors.darkShade6,
          outline: isLight ? AppColors.grayLight : AppColors.darkShade2,
          error: AppColors.error,
          onError: AppColors.white,
        );

    final textTheme =
        GoogleFonts.interTextTheme(
          isLight ? ThemeData.light().textTheme : ThemeData.dark().textTheme,
        ).apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        );

    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colorScheme.outline),
    );

    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme,
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorMaxLines: 2,
        filled: true,
        fillColor: colorScheme.surfaceContainer,
        labelStyle: TextStyle(color: AppColors.textHint),
        floatingLabelStyle: TextStyle(color: AppColors.textHint),
        hintStyle: TextStyle(color: AppColors.textHint),
        errorStyle: TextStyle(color: colorScheme.error),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder.copyWith(
          borderSide: BorderSide(color: colorScheme.outline, width: 1.5),
        ),
        errorBorder: inputBorder.copyWith(
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: inputBorder.copyWith(
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
        disabledBorder: inputBorder,
      ),
      searchBarTheme: SearchBarThemeData(
        hintStyle: WidgetStatePropertyAll(
          textTheme.bodyLarge?.copyWith(
            color: AppColors.textHint,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(colorScheme.surfaceContainer),
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: colorScheme.outline),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: const Size(64, 48),
          textStyle: textTheme.titleMedium,
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          disabledForegroundColor: AppColors.textHint,
          disabledBackgroundColor: colorScheme.surfaceContainerHighest,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      appBarTheme: AppBarTheme(
        titleSpacing: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: colorScheme.onSurface),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surfaceContainer,
        elevation: 1,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        indicatorColor: Colors.transparent,
        overlayColor: WidgetStatePropertyAll(
          colorScheme.primary.withValues(alpha: 0.12),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return textTheme.labelSmall?.copyWith(
            color: isSelected ? colorScheme.primary : AppColors.textHint,
          );
        }),
      ),
      dividerTheme: DividerThemeData(color: colorScheme.outline),
    );
  }
}
