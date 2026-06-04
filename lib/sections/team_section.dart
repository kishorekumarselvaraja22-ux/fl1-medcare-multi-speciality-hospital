import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../theme/responsive.dart';
import '../widgets/section_title.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

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
          SectionTitle(title: 'Meet Our Doctors'),
          SizedBox(height: isMobile ? 32 : 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              Container(
                width: isMobile ? double.infinity : (isTablet ? 260 : 240),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.02),
                  borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                  border:
                      Border.all(color: Colors.white.withValues(alpha: 0.05)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.network(
                            'https://images.unsplash.com/photo-1559839734-2b71ea197ec2',
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Dr. Sarah Johnson',
                        style: GoogleFonts.getFont(AppTypography.headingFont,
                            textStyle: const TextStyle(
                                color: AppColors.text,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                    Text('Senior Cardiologist',
                        style: GoogleFonts.getFont(AppTypography.bodyFont,
                            textStyle: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w600))),
                    const SizedBox(height: 8),
                    Text('15+ years experience in cardiac care.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(AppTypography.bodyFont,
                            textStyle: TextStyle(
                                color: AppColors.text.withValues(alpha: 0.5),
                                fontSize: 12))),
                  ],
                ),
              ),
              Container(
                width: isMobile ? double.infinity : (isTablet ? 260 : 240),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.02),
                  borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                  border:
                      Border.all(color: Colors.white.withValues(alpha: 0.05)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.network(
                            'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d',
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Dr. Michael Brown',
                        style: GoogleFonts.getFont(AppTypography.headingFont,
                            textStyle: const TextStyle(
                                color: AppColors.text,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                    Text('Neurologist',
                        style: GoogleFonts.getFont(AppTypography.bodyFont,
                            textStyle: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w600))),
                    const SizedBox(height: 8),
                    Text('Specialist in neurological disorders.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(AppTypography.bodyFont,
                            textStyle: TextStyle(
                                color: AppColors.text.withValues(alpha: 0.5),
                                fontSize: 12))),
                  ],
                ),
              ),
              Container(
                width: isMobile ? double.infinity : (isTablet ? 260 : 240),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.02),
                  borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                  border:
                      Border.all(color: Colors.white.withValues(alpha: 0.05)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.network(
                            'https://images.unsplash.com/photo-1594824476967-48c8b964273f',
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Dr. Emily Davis',
                        style: GoogleFonts.getFont(AppTypography.headingFont,
                            textStyle: const TextStyle(
                                color: AppColors.text,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                    Text('Pediatrician',
                        style: GoogleFonts.getFont(AppTypography.bodyFont,
                            textStyle: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w600))),
                    const SizedBox(height: 8),
                    Text('Dedicated child healthcare expert.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(AppTypography.bodyFont,
                            textStyle: TextStyle(
                                color: AppColors.text.withValues(alpha: 0.5),
                                fontSize: 12))),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}