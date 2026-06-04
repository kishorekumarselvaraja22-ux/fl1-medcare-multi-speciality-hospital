import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../theme/responsive.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);

    final infoWidget = Column(
      crossAxisAlignment: 'map_form' == 'simple'
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Contact', isCentered: 'map_form' == 'simple'),
        const SizedBox(height: 24),
        if ('+1 800 555 1000'.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text('Phone: +1 800 555 1000',
                style: GoogleFonts.getFont(AppTypography.bodyFont,
                    textStyle: TextStyle(
                        color: AppColors.text, fontSize: isMobile ? 14 : 16))),
          ),
        if ('[info@medcarehospital.com](mailto:info@medcarehospital.com)'
            .isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
                'Email: [info@medcarehospital.com](mailto:info@medcarehospital.com)',
                style: GoogleFonts.getFont(AppTypography.bodyFont,
                    textStyle: TextStyle(
                        color: AppColors.text, fontSize: isMobile ? 14 : 16))),
          ),
        if ('123 Medical Avenue, New York, USA'.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text('Address: 123 Medical Avenue, New York, USA',
                style: GoogleFonts.getFont(AppTypography.bodyFont,
                    textStyle: TextStyle(
                        color: AppColors.text, fontSize: isMobile ? 14 : 16))),
          ),
      ],
    );

    final formWidget = !true
        ? const SizedBox.shrink()
        : AppCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const TextField(
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.white70))),
                const SizedBox(height: 16),
                const TextField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white70))),
                const SizedBox(height: 16),
                const TextField(
                    decoration: InputDecoration(
                        labelText: 'Message',
                        labelStyle: TextStyle(color: Colors.white70)),
                    maxLines: 4),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    text: 'Submit Form',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          );

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile
              ? AppSpacing.sectionPadding * 0.6
              : AppSpacing.sectionPadding,
          horizontal: isMobile ? 20 : 48),
      color: AppColors.background,
      child: () {
        if ('map_form' == 'cards') {
          return Column(
            children: [
              SectionTitle(title: 'Contact'),
              const SizedBox(height: 40),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  if ('+1 800 555 1000'.isNotEmpty)
                    Container(
                      width: isMobile ? double.infinity : 260,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.02),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.05)),
                          borderRadius:
                              BorderRadius.circular(AppTheme.cardRadius)),
                      child: Column(
                        children: [
                          const Icon(Icons.phone_rounded,
                              color: AppColors.primary, size: 32),
                          const SizedBox(height: 12),
                          const Text('Call Support',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 6),
                          Text('+1 800 555 1000',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  if ('[info@medcarehospital.com](mailto:info@medcarehospital.com)'
                      .isNotEmpty)
                    Container(
                      width: isMobile ? double.infinity : 260,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.02),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.05)),
                          borderRadius:
                              BorderRadius.circular(AppTheme.cardRadius)),
                      child: Column(
                        children: [
                          const Icon(Icons.email_rounded,
                              color: AppColors.primary, size: 32),
                          const SizedBox(height: 12),
                          const Text('Email Sales',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 6),
                          Text(
                              '[info@medcarehospital.com](mailto:info@medcarehospital.com)',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  if ('123 Medical Avenue, New York, USA'.isNotEmpty)
                    Container(
                      width: isMobile ? double.infinity : 260,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.02),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.05)),
                          borderRadius:
                              BorderRadius.circular(AppTheme.cardRadius)),
                      child: Column(
                        children: [
                          const Icon(Icons.location_on_rounded,
                              color: AppColors.primary, size: 32),
                          const SizedBox(height: 12),
                          const Text('Visit Headquarter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 6),
                          Text('123 Medical Avenue, New York, USA',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          );
        }

        if ('map_form' == 'simple') {
          return Column(
            children: [
              infoWidget,
              if (true) ...[
                const SizedBox(height: 32),
                Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: formWidget),
              ],
            ],
          );
        }

        if ('map_form' == 'split_map') {
          final mapWidget = Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(AppTheme.cardRadius),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_rounded, color: AppColors.primary, size: 48),
                  const SizedBox(height: 8),
                  Text('Interactive Map (Placeholder)',
                      style: TextStyle(
                          color: AppColors.text.withValues(alpha: 0.4),
                          fontSize: 12)),
                ],
              ),
            ),
          );
          return isMobile || isTablet
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    infoWidget,
                    const SizedBox(height: 20),
                    mapWidget,
                    if (true) ...[
                      const SizedBox(height: 32),
                      formWidget,
                    ],
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          infoWidget,
                          const SizedBox(height: 24),
                          mapWidget,
                        ],
                      ),
                    ),
                    if (true) ...[
                      const SizedBox(width: 48),
                      Expanded(child: formWidget),
                    ],
                  ],
                );
        }

        // Default split layout
        return isMobile || isTablet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  infoWidget,
                  if (true) ...[
                    const SizedBox(height: 32),
                    formWidget,
                  ],
                ],
              )
            : Row(
                children: [
                  Expanded(child: infoWidget),
                  if (true) ...[
                    const SizedBox(width: 48),
                    Expanded(child: formWidget),
                  ],
                ],
              );
      }(),
    );
  }
}