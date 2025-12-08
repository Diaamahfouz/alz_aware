import 'dart:async';
import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/core/theme/app_images.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderSection extends StatefulWidget {
  final bool isTablet;
  const SliderSection({required this.isTablet, super.key});

  @override
  SliderSectionState createState() => SliderSectionState();
}

class SliderSectionState extends State<SliderSection> {
  int _currentIndex = 0;
  PageController? _pageController;
  Timer? _timer;
  static const int _infiniteOffset = 1000;
  late List<String> images;
  late List<String> titles;

  @override
  void initState() {
    images = [
      AppImages.coreCommonAssetsImagesSlide1,
      AppImages.coreCommonAssetsImagesSlider2,
      AppImages.coreCommonAssetsImagesSlider3,
      AppImages.coreCommonAssetsImagesSlider4,
      AppImages.coreCommonAssetsImagesSlide5,
      AppImages.coreCommonAssetsImagesSlider6,
      AppImages.coreCommonAssetsImagesSlide7,
    ];
    titles = [
      'Not every forgetfulness is normal',
      'Give them time, not judgment.',
      'Alzheimer’s isn’t weakness — it’s a silent battle.',
      'Their memories need love, not blame.',
      'Not every forgetfulness is normal',
      'Give them time, not judgment.',
      'Alzheimer’s isn’t weakness — it’s a silent battle.',
    ];
    super.initState();
    _initPageController();
    _startAutoScroll();
  }

  void _initPageController() {
    _pageController?.dispose();
    // Start at a high number to allow infinite scrolling in both directions
    _pageController = PageController(initialPage: _infiniteOffset);
    // Start at a high number to allow infinite scrolling in both directions
    _pageController = PageController(initialPage: _infiniteOffset);
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) return;
      int itemCount = images.length;
      if (itemCount == 0) return;
      _pageController?.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: widget.isTablet ? 388.h : 288.h,
            child: _pageController == null
                ? const SizedBox()
                : PageView.builder(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    allowImplicitScrolling: true,
                    // Remove itemCount to enable infinite scrolling
                    // Remove itemCount to enable infinite scrolling
                    onPageChanged: (index) {
                      int itemCount = images.length;
                      if (itemCount > 0) {
                        setState(() {
                          _currentIndex = index % itemCount;
                        });
                      }
                    },
                    itemBuilder: (_, index) {
                      int itemCount = images.length;
                      if (itemCount == 0) return const SizedBox();
                      int actualIndex = index % itemCount;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: Image.asset(
                                images[actualIndex],
                                // width: double.infinity,
                                height: widget.isTablet ? 388.h : 288.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.originalBlack.withValues(
                                  alpha: 0.5,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.r),
                                  bottomRight: Radius.circular(16.r),
                                ),
                              ),
                              child: Text(
                                titles[actualIndex],
                                textAlign: TextAlign.center,
                                style: Styles.medium16.copyWith(
                                  color: AppColors.originalWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 12.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    int itemCount = images.length;
                    if (itemCount > 0 && _pageController != null) {
                      int currentPage = _pageController!.page?.round() ?? 0;
                      int currentActualIndex = currentPage % itemCount;
                      int targetPage =
                          currentPage + (index - currentActualIndex);
                      _pageController!.animateToPage(
                        targetPage,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Container(
                    width: 12.w,
                    height: 12.h,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _currentIndex == index
                            ? AppColors.primerColor
                            : Colors.grey,
                        width: 2.r,
                      ),
                    ),
                  ),
                );
              },
              itemCount: images.length,
            ),
          ),
        ],
      ),
    );
  }
}
