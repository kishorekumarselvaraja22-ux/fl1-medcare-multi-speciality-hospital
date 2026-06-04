import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../theme/responsive.dart';
import '../widgets/app_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final isDesktop = Responsive.isDesktop(context);

    final forceStack = isMobile || isTablet;
    final style = 'background_image';
    final isBgImage = style == 'background_image';
    final textColor = isBgImage ? Colors.white : AppColors.text;
    final isSimple = style == 'simple';
    final isCentered = style == 'centered' ||
        style == 'minimal_stats' ||
        style == 'trust_banner' ||
        style == 'dashboard' ||
        style == 'background_image' ||
        style == 'app_download' ||
        forceStack ||
        isSimple;
    final hasImage =
        'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb'
                .isNotEmpty &&
            style != 'simple' &&
            style != 'minimal_stats' &&
            style != 'trust_banner' &&
            style != 'background_image' &&
            style != 'app_download' &&
            style != 'pricing' &&
            style != 'floating_cards';

    Widget buildStatItem(String val, String lbl) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            val,
            style: GoogleFonts.getFont(AppTypography.headingFont,
                textStyle: TextStyle(
                  fontSize: AppTypography.h2Size * 1.1,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                )),
          ),
          const SizedBox(height: 4),
          Text(
            lbl.toUpperCase(),
            style: GoogleFonts.getFont(AppTypography.bodyFont,
                textStyle: TextStyle(
                  fontSize: AppTypography.bodySize - 3,
                  fontWeight: FontWeight.w600,
                  color: textColor.withValues(alpha: 0.4),
                  letterSpacing: 1.2,
                )),
          ),
        ],
      );
    }

    Widget buildTrustLogo(IconData icon, String name) {
      return Opacity(
        opacity: 0.5,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: textColor, size: 20),
            const SizedBox(width: 6),
            Text(
              name,
              style: GoogleFonts.getFont(AppTypography.headingFont,
                  textStyle: TextStyle(
                    fontSize: AppTypography.bodySize - 1,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  )),
            ),
          ],
        ),
      );
    }

    Widget _buildStoreButton(
        IconData icon, String storeName, String badgeText) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: textColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: textColor.withValues(alpha: 0.15)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: textColor, size: 24),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  badgeText.toUpperCase(),
                  style: GoogleFonts.getFont(AppTypography.bodyFont,
                      textStyle: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: textColor.withValues(alpha: 0.5),
                      )),
                ),
                Text(
                  storeName,
                  style: GoogleFonts.getFont(AppTypography.headingFont,
                      textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      )),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget buildDashboardMockup(String url) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 28,
              decoration: BoxDecoration(
                color: textColor.withValues(alpha: 0.08),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                border: Border(
                    bottom:
                        BorderSide(color: textColor.withValues(alpha: 0.05))),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                          color: Colors.redAccent, shape: BoxShape.circle)),
                  const SizedBox(width: 4),
                  Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                          color: Colors.amberAccent, shape: BoxShape.circle)),
                  const SizedBox(width: 4),
                  Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                          color: Colors.greenAccent, shape: BoxShape.circle)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          'dashboard.revochamp.io',
                          style: TextStyle(
                              fontSize: 9,
                              color: textColor.withValues(alpha: 0.4),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: AppColors.primary.withValues(alpha: 0.1),
                  child: Center(
                    child: Icon(Icons.dashboard_rounded,
                        size: 64, color: AppColors.primary),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildImageWidget(String url) {
      if (style == 'dashboard') {
        return buildDashboardMockup(url);
      }
      final img = ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.primary.withValues(alpha: 0.1),
            child: Center(
              child:
                  Icon(Icons.image_rounded, size: 64, color: AppColors.primary),
            ),
          ),
        ),
      );

      if (style == 'video') {
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(child: img),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                  ),
                ),
              ),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(Icons.play_arrow_rounded,
                    color: Colors.white, size: 36),
              ),
            ],
          ),
        );
      }
      return img;
    }

    Widget buildPricingCard() {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: textColor.withValues(alpha: 0.02),
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
          border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.15), width: 2),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.05),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'POPULAR PLAN',
                style: GoogleFonts.getFont(AppTypography.headingFont,
                    textStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    )),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Growth Pro',
              style: GoogleFonts.getFont(AppTypography.headingFont,
                  textStyle: TextStyle(
                    fontSize: AppTypography.h2Size - 2,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  )),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '\$29',
                  style: GoogleFonts.getFont(AppTypography.headingFont,
                      textStyle: TextStyle(
                        fontSize: AppTypography.h1Size - 4,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      )),
                ),
                Text(
                  '/mo',
                  style: GoogleFonts.getFont(AppTypography.bodyFont,
                      textStyle: TextStyle(
                        fontSize: AppTypography.bodySize - 2,
                        color: textColor.withValues(alpha: 0.5),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: textColor.withValues(alpha: 0.1)),
            const SizedBox(height: 12),
            ...[
              'All core features included',
              'Unlimited custom domains',
              '24/7 Priority support',
            ].map((feat) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_rounded,
                          color: AppColors.primary, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        feat,
                        style: GoogleFonts.getFont(AppTypography.bodyFont,
                            textStyle: TextStyle(
                              fontSize: AppTypography.bodySize - 2,
                              color: textColor.withValues(alpha: 0.7),
                            )),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                text: 'Get Started Now',
                onPressed: () {},
              ),
            ),
          ],
        ),
      );
    }

    Widget buildFloatingCardItem(
        String title, String desc, IconData icon, Color color) {
      return Container(
        width: 200,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: textColor.withValues(alpha: 0.08)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.getFont(AppTypography.headingFont,
                        textStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        )),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: GoogleFonts.getFont(AppTypography.bodyFont,
                        textStyle: TextStyle(
                          fontSize: 9,
                          color: textColor.withValues(alpha: 0.5),
                          height: 1.3,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget buildFloatingCards() {
      return SizedBox(
        height: 320,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 20,
              right: 10,
              child: buildFloatingCardItem(
                'Lightning Fast',
                'Optimized performance with instant loading times.',
                Icons.bolt_rounded,
                AppColors.primary,
              ),
            ),
            Positioned(
              top: 110,
              left: 10,
              child: buildFloatingCardItem(
                'Secure Payments',
                'Bank-grade security keeping all transactions safe.',
                Icons.shield_rounded,
                Colors.tealAccent,
              ),
            ),
            Positioned(
              top: 200,
              right: 20,
              child: buildFloatingCardItem(
                'AI Powered',
                'Smart insights and automated recommendation engine.',
                Icons.psychology_rounded,
                Colors.purpleAccent,
              ),
            ),
          ],
        ),
      );
    }

    final contentWidget = Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if ('Trusted Medical Care Since 2005'.isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Trusted Medical Care Since 2005',
              style: GoogleFonts.getFont(AppTypography.bodyFont,
                  textStyle: TextStyle(
                    color: AppColors.primary,
                    fontSize: AppTypography.bodySize - 1,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
          const SizedBox(height: 16),
        ],
        Text(
          'Advanced Healthcare For Every Family',
          textAlign: isCentered ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.getFont(AppTypography.headingFont,
              textStyle: TextStyle(
                color: textColor,
                fontSize: isMobile
                    ? AppTypography.h1Size * 0.8
                    : AppTypography.h1Size,
                fontWeight: FontWeight.bold,
                height: 1.2,
              )),
        ),
        const SizedBox(height: 16),
        Text(
          'Providing comprehensive healthcare services with experienced doctors, modern technology, and patient-centered care.',
          textAlign: isCentered ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.getFont(AppTypography.bodyFont,
              textStyle: TextStyle(
                color: isBgImage
                    ? Colors.white.withValues(alpha: 0.7)
                    : textColor.withValues(alpha: 0.6),
                fontSize: isMobile
                    ? AppTypography.bodySize - 1
                    : AppTypography.bodySize,
                height: 1.5,
              )),
        ),
        const SizedBox(height: 32),
        if (style == 'app_download') ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment:
                isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              _buildStoreButton(
                  Icons.apple_rounded, 'App Store', 'Download on the'),
              const SizedBox(width: 12),
              _buildStoreButton(
                  Icons.play_arrow_rounded, 'Google Play', 'GET IT ON'),
            ],
          ),
        ] else ...[
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: isCentered ? WrapAlignment.center : WrapAlignment.start,
            children: [
              AppButton(
                text: 'Book Appointment',
                onPressed: () {},
              ),
              if ('Find Doctor'.isNotEmpty) ...[
                AppButton(
                  text: 'Find Doctor',
                  isPrimary: false,
                  onPressed: () {},
                ),
              ],
            ],
          ),
        ],
        if (style == 'minimal_stats') ...[
          const SizedBox(height: 48),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: textColor.withValues(alpha: 0.02),
              borderRadius: BorderRadius.circular(AppTheme.cardRadius),
              border: Border.all(color: textColor.withValues(alpha: 0.06)),
            ),
            child: forceStack
                ? Column(
                    children: [
                      buildStatItem('10K+', 'Customers'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child:
                            Divider(color: textColor.withValues(alpha: 0.08)),
                      ),
                      buildStatItem('99.9%', 'Uptime'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child:
                            Divider(color: textColor.withValues(alpha: 0.08)),
                      ),
                      buildStatItem('24/7', 'Support'),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: buildStatItem('10K+', 'Customers')),
                      Container(
                          width: 1,
                          height: 40,
                          color: textColor.withValues(alpha: 0.1)),
                      Expanded(child: buildStatItem('99.9%', 'Uptime')),
                      Container(
                          width: 1,
                          height: 40,
                          color: textColor.withValues(alpha: 0.1)),
                      Expanded(child: buildStatItem('24/7', 'Support')),
                    ],
                  ),
          ),
        ],
        if (style == 'trust_banner') ...[
          const SizedBox(height: 48),
          Column(
            children: [
              Text(
                'Trusted by the world\'s best teams'.toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(AppTypography.bodyFont,
                    textStyle: TextStyle(
                      fontSize: AppTypography.bodySize - 3,
                      fontWeight: FontWeight.bold,
                      color: textColor.withValues(alpha: 0.35),
                      letterSpacing: 1.5,
                    )),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: forceStack ? 16 : 32,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  buildTrustLogo(Icons.bolt_rounded, 'BoltPay'),
                  buildTrustLogo(Icons.bubble_chart_rounded, 'Sphere'),
                  buildTrustLogo(Icons.shield_rounded, 'Armor'),
                  buildTrustLogo(Icons.rocket_launch_rounded, 'Aether'),
                  buildTrustLogo(Icons.handshake_rounded, 'Synergy'),
                ],
              ),
            ],
          ),
        ],
      ],
    );

    Widget finalLayout;
    if (isSimple ||
        style == 'minimal_stats' ||
        style == 'trust_banner' ||
        style == 'background_image') {
      finalLayout = Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: contentWidget,
        ),
      );
    } else if (forceStack) {
      finalLayout = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: (style == 'image_left' || style == 'video') && hasImage
            ? [
                if (hasImage) ...[
                  buildImageWidget(
                      'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb'),
                  const SizedBox(height: 32),
                ],
                contentWidget,
              ]
            : style == 'pricing'
                ? [
                    contentWidget,
                    const SizedBox(height: 32),
                    buildPricingCard(),
                  ]
                : style == 'floating_cards'
                    ? [
                        contentWidget,
                        const SizedBox(height: 32),
                        buildFloatingCards(),
                      ]
                    : [
                        contentWidget,
                        if (hasImage) ...[
                          const SizedBox(height: 32),
                          buildImageWidget(
                              'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb'),
                        ],
                      ],
      );
    } else if (style == 'centered' ||
        style == 'dashboard' ||
        style == 'app_download') {
      finalLayout = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: contentWidget,
          ),
          if (hasImage) ...[
            const SizedBox(height: 48),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: buildImageWidget(
                  'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb'),
            ),
          ],
        ],
      );
    } else if (style == 'image_left') {
      finalLayout = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasImage) ...[
            Expanded(
              flex: 5,
              child: buildImageWidget(
                  'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb'),
            ),
            const SizedBox(width: 48),
          ],
          Expanded(
            flex: 6,
            child: contentWidget,
          ),
        ],
      );
    } else if (style == 'pricing') {
      finalLayout = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: contentWidget,
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 5,
            child: buildPricingCard(),
          ),
        ],
      );
    } else if (style == 'floating_cards') {
      finalLayout = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: contentWidget,
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 5,
            child: buildFloatingCards(),
          ),
        ],
      );
    } else {
      finalLayout = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: contentWidget,
            ),
          ),
          if (hasImage) ...[
            Expanded(
              flex: 5,
              child: buildImageWidget(
                  'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb'),
            ),
          ],
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile
              ? AppSpacing.sectionPadding * 0.6
              : AppSpacing.sectionPadding,
          horizontal: isMobile ? 20 : 48),
      decoration: BoxDecoration(
        color: style == 'background_image' || style == 'gradient'
            ? null
            : AppColors.background,
        gradient: style == 'gradient'
            ? LinearGradient(
                colors: [
                  AppColors.background,
                  AppColors.background.withValues(alpha: 0.8),
                  AppColors.primary.withValues(alpha: 0.15)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        image: style == 'background_image' &&
                'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb'
                    .isNotEmpty
            ? DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1631815588090-d4bfec5b1ccb'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.7),
                  BlendMode.darken,
                ),
              )
            : null,
      ),
      child: finalLayout,
    );
  }
}