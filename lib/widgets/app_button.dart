import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_theme.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      if (isPrimary) {
        return ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.white, size: 18),
          label: Text(text,
              style: GoogleFonts.getFont(AppTypography.buttonFont,
                  textStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.buttonRadius)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        );
      } else {
        return OutlinedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, color: AppColors.text, size: 18),
          label: Text(text,
              style: GoogleFonts.getFont(AppTypography.buttonFont,
                  textStyle: const TextStyle(
                      color: AppColors.text, fontWeight: FontWeight.bold))),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.text),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.buttonRadius)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        );
      }
    }
    if (isPrimary) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.buttonRadius)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        child: Text(text,
            style: GoogleFonts.getFont(AppTypography.buttonFont,
                textStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.text,
          side: const BorderSide(color: AppColors.text),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.buttonRadius)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        child: Text(text,
            style: GoogleFonts.getFont(AppTypography.buttonFont,
                textStyle: const TextStyle(fontWeight: FontWeight.bold))),
      );
    }
  }
}