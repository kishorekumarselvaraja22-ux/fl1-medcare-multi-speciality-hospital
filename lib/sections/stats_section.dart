import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';
import '../theme/app_spacing.dart';
import '../theme/responsive.dart';
import '../widgets/section_title.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);

    final sectionTitle = 'Trusted By Thousands';
    final sectionSubtitle = 'Our results speak for themselves.';
    final displayStats = <Map<String, dynamic>>[
      {
        'value': '10K+',
        'label': 'Happy Customers',
        'icon': 'people_alt_rounded'
      },
      {'value': '99.9%', 'label': 'Uptime SLA', 'icon': 'verified_rounded'},
      {'value': '150+', 'label': 'Countries Served', 'icon': 'public_rounded'},
      {
        'value': '24/7',
        'label': 'Expert Support',
        'icon': 'support_agent_rounded'
      },
    ];
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile
              ? AppSpacing.sectionPadding * 0.6
              : AppSpacing.sectionPadding,
          horizontal: isMobile ? 20 : 48),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SectionTitle(
              title: sectionTitle,
              subtitle: sectionSubtitle.isNotEmpty ? sectionSubtitle : null),
          const SizedBox(height: 48),
          Wrap(
            spacing: 32,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: displayStats.map((s) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(AppIcons.getIconData(s['icon']!),
                      color: AppColors.primary, size: 24),
                  const SizedBox(width: 10),
                  Text(
                    s['value']!,
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    s['label']!,
                    style: TextStyle(
                        color: AppColors.text.withValues(alpha: 0.6),
                        fontSize: 14),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}