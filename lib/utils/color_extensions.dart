import 'package:flutter/material.dart';

/// Extension to safely get color shades for MaterialColor and regular Color
extension ColorShades on Color {
  Color get shade50 => this is MaterialColor ? (this as MaterialColor).shade50 : _getShade(50);
  Color get shade100 => this is MaterialColor ? (this as MaterialColor).shade100 : _getShade(100);
  Color get shade200 => this is MaterialColor ? (this as MaterialColor).shade200 : _getShade(200);
  Color get shade300 => this is MaterialColor ? (this as MaterialColor).shade300 : _getShade(300);
  Color get shade400 => this is MaterialColor ? (this as MaterialColor).shade400 : _getShade(400);
  Color get shade600 => this is MaterialColor ? (this as MaterialColor).shade600 : _getShade(600);
  Color get shade700 => this is MaterialColor ? (this as MaterialColor).shade700 : _getShade(700);
  Color get shade800 => this is MaterialColor ? (this as MaterialColor).shade800 : _getShade(800);
  Color get shade900 => this is MaterialColor ? (this as MaterialColor).shade900 : _getShade(900);

  Color _getShade(int shade) {
    if (this is MaterialColor) {
      return (this as MaterialColor)[shade]!;
    }
    
    // For regular colors, create approximate shades
    final hsl = HSLColor.fromColor(this);
    switch (shade) {
      case 50:
        return hsl.withLightness(0.95).toColor();
      case 100:
        return hsl.withLightness(0.90).toColor();
      case 200:
        return hsl.withLightness(0.80).toColor();
      case 300:
        return hsl.withLightness(0.70).toColor();
      case 400:
        return hsl.withLightness(0.60).toColor();
      case 600:
        return hsl.withLightness(0.40).toColor();
      case 700:
        return hsl.withLightness(0.30).toColor();
      case 800:
        return hsl.withLightness(0.20).toColor();
      case 900:
        return hsl.withLightness(0.10).toColor();
      default:
        return this;
    }
  }
}
