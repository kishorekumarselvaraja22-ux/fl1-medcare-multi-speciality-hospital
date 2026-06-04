import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_spacing.dart';
import '../theme/responsive.dart';
import '../widgets/section_title.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);

    final sectionTitle = 'Patient Testimonials';
    final sectionSubtitle =
        'Real feedback from real customers who trust us every day.';
    final items = <Map<String, dynamic>>[
      {
        'quote': 'Great experience!',
        'author': 'John Doe',
        'role': 'CEO',
        'rating': 5,
        'videoThumbnail':
            'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=500'
      },
      {
        'quote': 'Great experience!',
        'author': 'John Doe',
        'role': 'CEO',
        'rating': 5,
        'videoThumbnail':
            'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=500'
      },
    ];
    if (items.isEmpty) return const SizedBox.shrink();
    int activeSlide = 0;

    return StatefulBuilder(builder: (context, setState) {
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
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: items.map((item) {
                return Container(
                  width: isMobile ? double.infinity : (isTablet ? 320 : 280),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.03),
                    borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.07)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(AppTheme.cardRadius),
                                  topRight:
                                      Radius.circular(AppTheme.cardRadius),
                                ),
                                child: Image.network(
                                  item['videoThumbnail'] as String,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, err, stack) =>
                                      Container(color: Colors.white10),
                                ),
                              ),
                            ),
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.play_arrow_rounded,
                                  color: Colors.white, size: 24),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                children: List.generate(
                                    item['rating'] as int,
                                    (i) => const Icon(Icons.star_rounded,
                                        size: 14, color: Color(0xFFF59E0B)))),
                            const SizedBox(height: 10),
                            Text('"' + (item['quote'] as String) + '"',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 13,
                                    height: 1.4,
                                    color: Colors.white70)),
                            const SizedBox(height: 12),
                            Text(item['author'] as String,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                            Text(item['role'] as String,
                                style: TextStyle(
                                    color: AppColors.primary, fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    });
  }
}