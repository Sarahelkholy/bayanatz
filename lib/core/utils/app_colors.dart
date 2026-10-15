import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand & Primary
  static const Color primaryColor = Color(0xFF7D7D7D);
  static const Color lightPink = Color(0xFFF9ECF0);

  // Background & Surfaces
  static const Color background = Color(
    0xFFF5F5F5,
  ); // Light grey canvas from the design[cite: 1, 2]
  static const Color white = Color(
    0xFFFFFFFF,
  ); // Card and container background[cite: 1, 2]

  // Borders & Dividers
  static const Color grayLight = Color(
    0xFFE0E2E6,
  ); // Card and input borders[cite: 1, 2]
  static const Color grayMedium = Color(0xFFA6A6A6);
  static const Color grayNeutral = Color(0xFF7D7D7D);

  // Text Colors
  static const Color textDark = Color(
    0xFF1D2125,
  ); // Main titles and headers[cite: 2]
  static const Color textHint = Color(
    0xFF8C9199,
  ); // Subtitles and hints[cite: 1, 2]
  static const Color textMuted = Color(0xFF7C7C7C);

  // Action Buttons & Badges (Neutral Grays from Design)
  static const Color buttonBackgroundLight = Color(
    0xFFE2E4E8,
  ); // e.g., Reset button[cite: 1]
  static const Color buttonBackgroundDark = Color(
    0xFF9E9E9E,
  ); // e.g., Apply / Dashboard buttons[cite: 1, 2]

  // Status & Feedback
  static const Color success = Color(0xFF0CB258);
  static const Color error = Color(0xFFCC1010);
  static const Color buttonTextOnPrimary = Color(0xFFF9F9F9);

  // Dark Theme Base & Shades
  static const Color darkBase = Color(0xFF0C1015);
  static const Color darkShade1 = Color(0xFF34383C);
  static const Color darkShade2 = Color(0xFF5D6063);
  static const Color darkShade6 = Color(0xFF35383C);
  static const Color darkShade7 = Color(0xFFEAEAEA);
}
