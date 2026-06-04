import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../theme/responsive.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile
              ? AppSpacing.sectionPadding * 0.6
              : AppSpacing.sectionPadding,
          horizontal: isMobile ? 20 : 48),
      color: AppColors.background,
      child: Column(
        children: [
          SectionTitle(
            title: 'Why Patients Choose Us',
            subtitle:
                'We build top-tier software visual builders with robust design standards.',
          ),
          SizedBox(height: isMobile ? 32 : 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: isMobile ? double.infinity : (isTablet ? 320 : 280),
                child: AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.verified_rounded,
                            color: AppColors.primary, size: 24),
                      ),
                      const SizedBox(height: 16),
                      Text('Expert Doctors',
                          style: GoogleFonts.getFont(AppTypography.headingFont,
                              textStyle: const TextStyle(
                                  color: AppColors.text,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(height: 8),
                      Text('',
                          style: GoogleFonts.getFont(AppTypography.bodyFont,
                              textStyle: TextStyle(
                                  color: AppColors.text.withValues(alpha: 0.6),
                                  fontSize: 13))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: isMobile ? double.infinity : (isTablet ? 320 : 280),
                child: AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.web_rounded,
                            color: AppColors.primary, size: 24),
                      ),
                      const SizedBox(height: 16),
                      Text('24/7 Emergency',
                          style: GoogleFonts.getFont(AppTypography.headingFont,
                              textStyle: const TextStyle(
                                  color: AppColors.text,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(height: 8),
                      Text('',
                          style: GoogleFonts.getFont(AppTypography.bodyFont,
                              textStyle: TextStyle(
                                  color: AppColors.text.withValues(alpha: 0.6),
                                  fontSize: 13))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: isMobile ? double.infinity : (isTablet ? 320 : 280),
                child: AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.web_rounded,
                            color: AppColors.primary, size: 24),
                      ),
                      const SizedBox(height: 16),
                      Text('Modern Equipment',
                          style: GoogleFonts.getFont(AppTypography.headingFont,
                              textStyle: const TextStyle(
                                  color: AppColors.text,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(height: 8),
                      Text('',
                          style: GoogleFonts.getFont(AppTypography.bodyFont,
                              textStyle: TextStyle(
                                  color: AppColors.text.withValues(alpha: 0.6),
                                  fontSize: 13))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: isMobile ? double.infinity : (isTablet ? 320 : 280),
                child: AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.web_rounded,
                            color: AppColors.primary, size: 24),
                      ),
                      const SizedBox(height: 16),
                      Text('Affordable Care',
                          style: GoogleFonts.getFont(AppTypography.headingFont,
                              textStyle: const TextStyle(
                                  color: AppColors.text,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(height: 8),
                      Text('',
                          style: GoogleFonts.getFont(AppTypography.bodyFont,
                              textStyle: TextStyle(
                                  color: AppColors.text.withValues(alpha: 0.6),
                                  fontSize: 13))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}