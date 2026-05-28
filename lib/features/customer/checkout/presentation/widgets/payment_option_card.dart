import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentOptionCard extends StatelessWidget {
  const PaymentOptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            colors: [
              context.color.containerLinear1!.withOpacity(0.8),
              context.color.containerLinear2!.withOpacity(0.8),
            ],
            begin: const Alignment(0.36, 0.27),
            end: const Alignment(0.58, 0.85),
          ),
          border: isSelected
              ? Border.all(
                  color: context.color.bluePinkLight!.withOpacity(0.5),
                  width: 1.5,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: context.color.containerShadow1!.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: context.color.bluePinkLight!.withOpacity(0.1),
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  height: 22.h,
                  colorFilter: ColorFilter.mode(
                    context.color.bluePinkLight!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: title,
                    theme: context.textStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: context.color.textColor,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextApp(
                    text: subtitle,
                    theme: context.textStyle.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeightHelper.regular,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              isSelected
                  ? AppImages.icRadioChecked
                  : AppImages.icRadioUnchecked,
              height: 22.h,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? context.color.bluePinkLight!
                    : Colors.grey.shade400,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
