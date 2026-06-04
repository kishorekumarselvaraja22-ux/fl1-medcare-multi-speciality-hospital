import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      padding:
          EdgeInsets.symmetric(vertical: 40, horizontal: isMobile ? 24 : 48),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
            top: BorderSide(color: AppColors.text.withValues(alpha: 0.08))),
      ),
      child: isMobile
          ? Column(
              children: [
                Text('MedCare Hospital',
                    style: GoogleFonts.getFont(AppTypography.headingFont,
                        textStyle: const TextStyle(
                            color: AppColors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
                const SizedBox(height: 12),
                Text('© 2026 MedCare Hospital. All Rights Reserved.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(AppTypography.bodyFont,
                        textStyle: TextStyle(
                            color: AppColors.text.withValues(alpha: 0.4),
                            fontSize: 11))),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('MedCare Hospital',
                    style: GoogleFonts.getFont(AppTypography.headingFont,
                        textStyle: const TextStyle(
                            color: AppColors.text,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
                Text('© 2026 MedCare Hospital. All Rights Reserved.',
                    style: GoogleFonts.getFont(AppTypography.bodyFont,
                        textStyle: TextStyle(
                            color: AppColors.text.withValues(alpha: 0.4),
                            fontSize: 12))),
              ],
            ),
    );
  }
}