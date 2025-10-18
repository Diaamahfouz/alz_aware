import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeFeatureCard extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String subtitle;
  final String svgAsset;
  final Color? subtitleColor;
  final double? borderRadius;
  final double? iconSize;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const HomeFeatureCard({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
    required this.svgAsset,
    this.subtitleColor,
    this.borderRadius,
    this.iconSize,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: 8),
      padding: padding ?? EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            svgAsset,
            width: iconSize ?? 40,
            height: iconSize ?? 40,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Styles.medium16),
                Text(
                  subtitle,
                  style: Styles.regular14.copyWith(
                    color: subtitleColor ?? AppColors.grey74,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
