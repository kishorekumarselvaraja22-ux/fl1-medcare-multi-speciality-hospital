import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/responsive.dart';
import '../widgets/app_button.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 18, horizontal: isMobile ? 20 : (isTablet ? 24 : 32)),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
            bottom: BorderSide(color: AppColors.text.withValues(alpha: 0.08))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.health_and_safety_rounded,
                  color: AppColors.primary, size: 24),
              const SizedBox(width: 8),
              Text(
                'MedCare Hospital',
                style: GoogleFonts.getFont(AppTypography.headingFont,
                    textStyle: const TextStyle(
                        color: AppColors.text,
                        fontSize: AppTypography.h2Size,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu_rounded, color: AppColors.text),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.background,
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('Home',
                              style: GoogleFonts.getFont(AppTypography.bodyFont,
                                  textStyle:
                                      const TextStyle(color: AppColors.text))),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text('About',
                              style: GoogleFonts.getFont(AppTypography.bodyFont,
                                  textStyle:
                                      const TextStyle(color: AppColors.text))),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text('Services',
                              style: GoogleFonts.getFont(AppTypography.bodyFont,
                                  textStyle:
                                      const TextStyle(color: AppColors.text))),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text('Contact',
                              style: GoogleFonts.getFont(AppTypography.bodyFont,
                                  textStyle:
                                      const TextStyle(color: AppColors.text))),
                          onTap: () => Navigator.pop(context),
                        ),
                        const SizedBox(height: 16),
                        AppButton(
                          text: 'Close',
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          else ...[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Home',
                      style: GoogleFonts.getFont(AppTypography.bodyFont,
                          textStyle: const TextStyle(
                              color: AppColors.text,
                              fontSize: AppTypography.bodySize))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('About',
                      style: GoogleFonts.getFont(AppTypography.bodyFont,
                          textStyle: const TextStyle(
                              color: AppColors.text,
                              fontSize: AppTypography.bodySize))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Services',
                      style: GoogleFonts.getFont(AppTypography.bodyFont,
                          textStyle: const TextStyle(
                              color: AppColors.text,
                              fontSize: AppTypography.bodySize))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Contact',
                      style: GoogleFonts.getFont(AppTypography.bodyFont,
                          textStyle: const TextStyle(
                              color: AppColors.text,
                              fontSize: AppTypography.bodySize))),
                ),
              ],
            ),
            AppButton(
              text: 'Get Started',
              onPressed: () {},
            ),
          ],
        ],
      ),
    );
  }
}