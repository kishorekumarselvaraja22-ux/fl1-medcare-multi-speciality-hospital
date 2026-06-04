import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../theme/responsive.dart';
import '../widgets/section_title.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);

    final sectionTitle = 'Frequently Asked Questions';
    final sectionSubtitle =
        'Find answers to core billing and deployment procedures.';
    final items = <Map<String, dynamic>>[
      {
        'question': 'Do you provide emergency services?',
        'answer': 'Yes, emergency services are available 24/7.',
        'category': ''
      },
      {
        'question': 'Can I book appointments online?',
        'answer': 'Yes, appointments can be booked online anytime.',
        'category': ''
      },
      {
        'question': 'Do you accept insurance?',
        'answer': 'Yes, we accept most major insurance providers.',
        'category': ''
      },
    ];
    if (items.isEmpty) return const SizedBox.shrink();

    final categories = <String>{'All'};
    for (final item in items) {
      final cat = item['category'] as String? ?? '';
      if (cat.isNotEmpty) {
        categories.add(cat);
      }
    }

    int expandedIndex = 0;
    String selectedCategory = 'All';
    String searchQuery = '';

    return StatefulBuilder(builder: (context, setState) {
      final filteredItems = items.asMap().entries.where((entry) {
        final item = entry.value;
        final q = (item['question'] ?? '').toString().toLowerCase();
        final a = (item['answer'] ?? '').toString().toLowerCase();
        final cat = (item['category'] ?? '').toString();
        if ('search' == 'tabs' &&
            selectedCategory != 'All' &&
            cat != selectedCategory) {
          return false;
        }
        if ('search' == 'search' && searchQuery.isNotEmpty) {
          return q.contains(searchQuery) || a.contains(searchQuery);
        }
        return true;
      }).toList();

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
            const SizedBox(height: 32),
            if ('search' == 'search') ...[
              Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: TextField(
                  onChanged: (val) =>
                      setState(() => searchQuery = val.trim().toLowerCase()),
                  style: TextStyle(
                      color: AppColors.text,
                      fontFamily: AppTypography.bodyFont,
                      fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search FAQ...',
                    hintStyle: TextStyle(
                        color: AppColors.text.withValues(alpha: 0.4),
                        fontSize: 13),
                    prefixIcon: Icon(Icons.search_rounded,
                        color: AppColors.primary, size: 20),
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.02),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppTheme.buttonRadius),
                      borderSide: BorderSide(
                          color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppTheme.buttonRadius),
                      borderSide: BorderSide(
                          color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppTheme.buttonRadius),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
            if ('search' == 'tabs' && categories.length > 1) ...[
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: categories.map((cat) {
                  final isSelected = selectedCategory == cat;
                  return GestureDetector(
                    onTap: () => setState(() {
                      selectedCategory = cat;
                      expandedIndex = -1;
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.white.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Text(
                        cat,
                        style: GoogleFonts.getFont(AppTypography.bodyFont,
                            textStyle: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.text.withValues(alpha: 0.7),
                              fontSize: AppTypography.bodySize - 1,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
            ],
            if (filteredItems.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  'No questions found matching your search.',
                  style: GoogleFonts.getFont(AppTypography.bodyFont,
                      textStyle: TextStyle(
                        color: AppColors.text.withValues(alpha: 0.4),
                        fontSize: AppTypography.bodySize,
                      )),
                ),
              )
            else
              ...filteredItems.map((entry) {
                final idx = entry.key;
                final item = entry.value;
                final q = item['question'] as String;
                final a = item['answer'] as String;
                final isAccordion = 'search' == 'accordion' ||
                    'search' == 'tabs' ||
                    'search' == 'search' ||
                    'search'.isEmpty;
                final isExpanded = !isAccordion || (expandedIndex == idx);

                if ('search' == 'simple') {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          q,
                          style: GoogleFonts.getFont(AppTypography.headingFont,
                              textStyle: TextStyle(
                                color: AppColors.text,
                                fontSize: AppTypography.bodySize + 1,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          a,
                          style: GoogleFonts.getFont(AppTypography.bodyFont,
                              textStyle: TextStyle(
                                color: AppColors.text.withValues(alpha: 0.6),
                                fontSize: AppTypography.bodySize - 1,
                                height: 1.4,
                              )),
                        ),
                      ],
                    ),
                  );
                }

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.02),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.05)),
                    borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          if (isAccordion) {
                            setState(() {
                              expandedIndex = expandedIndex == idx ? -1 : idx;
                            });
                          }
                        },
                        borderRadius:
                            BorderRadius.circular(AppTheme.cardRadius),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.help_outline_rounded,
                                        color: AppColors.primary, size: 20),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        q,
                                        style: GoogleFonts.getFont(
                                            AppTypography.headingFont,
                                            textStyle: TextStyle(
                                              color: AppColors.text,
                                              fontSize: AppTypography.h3Size,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                isExpanded
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                color: AppColors.text.withValues(alpha: 0.4),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isExpanded) ...[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 52.0, right: 20.0, bottom: 20.0),
                          child: Text(
                            a,
                            style: GoogleFonts.getFont(AppTypography.bodyFont,
                                textStyle: TextStyle(
                                  color: AppColors.text.withValues(alpha: 0.6),
                                  fontSize: AppTypography.bodySize,
                                  height: 1.4,
                                )),
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              }).toList(),
          ],
        ),
      );
    });
  }
}