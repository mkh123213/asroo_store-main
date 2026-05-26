// ignore_for_file: deprecated_member_use

import 'package:asroo_store/core/app/env.variables.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildDeveloper extends StatelessWidget {
  const BuildDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushName(
          AppRoutes.webview,
          arguments: EnvVariable.instance.buildDeveloper,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            SvgPicture.asset(
              AppImages.piDeveloper,
              height: 22.h,
              colorFilter: ColorFilter.mode(
                context.color.textColor!,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: TextApp(
                text: context.translate(LangKeys.buildDeveloper),
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ),
            TextApp(
              text: 'Asroo Store',
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeightHelper.regular,
                color: context.color.textColor!.withOpacity(0.6),
              ),
            ),
            SizedBox(width: 5.w),
            SvgPicture.asset(
              Directionality.of(context) == TextDirection.rtl
                  ? AppImages.piChevronLeft
                  : AppImages.piChevronRight,
              height: 14.h,
              colorFilter: ColorFilter.mode(
                context.color.textColor!.withOpacity(0.6),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
