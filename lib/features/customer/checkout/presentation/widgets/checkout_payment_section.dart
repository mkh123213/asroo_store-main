import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutPaymentSection extends StatelessWidget {
  const CheckoutPaymentSection({required this.paymentLabel, super.key});

  final String paymentLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        boxShadow: [
          BoxShadow(
            color: context.color.containerShadow1!.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppImages.icCreditCard,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  context.color.bluePinkLight!,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: TextApp(
                  text: 'Payment Method',
                  theme: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.textColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.pushName(AppRoutes.paymentMethod),
                child: Row(
                  children: [
                    TextApp(
                      text: 'Change',
                      theme: context.textStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeightHelper.medium,
                        color: context.color.bluePinkLight,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    SvgPicture.asset(
                      AppImages.icChevronRight,
                      height: 12.h,
                      colorFilter: ColorFilter.mode(
                        context.color.bluePinkLight!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.icCash,
                height: 16.h,
                colorFilter: ColorFilter.mode(
                  Colors.grey.shade400,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              TextApp(
                text: paymentLabel,
                theme: context.textStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeightHelper.regular,
                  color: context.color.textColor?.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
