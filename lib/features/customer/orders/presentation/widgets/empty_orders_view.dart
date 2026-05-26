import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyOrdersView extends StatelessWidget {
  const EmptyOrdersView({this.isFooter = false, super.key});

  final bool isFooter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: Column(
          mainAxisSize: isFooter ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.piOrdersBag,
              height: 50.h,
              colorFilter: ColorFilter.mode(
                context.color.textColor!.withOpacity(0.3),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 16.h),
            TextApp(
              text: 'لم تجد طلبك؟',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            SizedBox(height: 8.h),
            TextApp(
              text: 'تأكد من تسجيل الدخول بالحساب الصحيح',
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeightHelper.regular,
                color: context.color.textColor!.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
            if (!isFooter) ...[
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () => context.pushNamedAndRemoveUntil(
                  AppRoutes.mainCustomer,
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: context.color.bluePinkLight,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: TextApp(
                    text: 'ابدأ التسوق',
                    theme: context.textStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeightHelper.medium,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
