import 'package:alz_aware/core/common/widgets/custom_button.dart';
import 'package:alz_aware/core/common/widgets/image_picker_with_out_copper.dart';
import 'package:alz_aware/core/routes/app_router_imports.dart';
import 'package:alz_aware/core/routes/routes.dart';
import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ModerateHighResult extends StatelessWidget {
  const ModerateHighResult({super.key, required this.isModerate});
  final bool isModerate;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isModerate
                ? 'Your answers suggest mild memory changes. '
                : 'Your responses indicate significant changes in memory or thinking.',
            style: Styles.regular14.copyWith(color: AppColors.grey74),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            isModerate
                ? 'For a clearer understanding, you can upload your brain scan for specialist review'
                : 'Upload your scan for medical review.',
            style: Styles.regular14.copyWith(color: AppColors.grey74),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 150.h),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'Later',
                    onTap: () {
                      context.go(Routes.home);
                    },
                    isGradient: false,
                    titleStyle: Styles.medium16.copyWith(
                      color: AppColors.black12,
                    ),
                    backGroundColor: AppColors.greyEE,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: CustomButton(
                    title: 'Scan',
                    onTap: () async {
                      await ImagePickerWithOutCopper()
                          .showPhotoPickerBottomSheet(context, (image) async {
                            if (image != null && context.mounted) {
                              context.go(
                                Routes.resultFromImage,
                                extra: {'image': image},
                              );
                            }
                          });
                    },
                    isGradient: false,
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
