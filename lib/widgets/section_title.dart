import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/responsive.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isCentered;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.isCentered = true,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: isCentered ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.getFont(
            AppTypography.headingFont,
            textStyle: TextStyle(
              color: AppColors.text,
              fontSize:
                  isMobile ? AppTypography.h1Size * 0.8 : AppTypography.h1Size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (subtitle != null && subtitle!.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            textAlign: isCentered ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.getFont(
              AppTypography.bodyFont,
              textStyle: TextStyle(
                color: AppColors.text.withValues(alpha: 0.5),
                fontSize: isMobile
                    ? AppTypography.bodySize - 1
                    : AppTypography.bodySize,
              ),
            ),
          ),
        ],
      ],
    );
  }
}