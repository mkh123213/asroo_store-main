// ignore_for_file: deprecated_member_use

import 'package:asroo_store/core/common/dialogs/custom_dialogs.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/core/utils/app_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomDialog.twoButtonDialog(
          context: context,
          textBody: context.translate(LangKeys.logOutFromApp),
          textButton1: context.translate(LangKeys.yes),
          textButton2: context.translate(LangKeys.no),
          isLoading: false,
          onPressed: () async {
            await AppLogout().logout();
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            SvgPicture.asset(
              AppImages.piLogout,
              height: 22.h,
              colorFilter: ColorFilter.mode(
                context.color.textColor!,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: TextApp(
                text: context.translate(LangKeys.logOut),
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ),
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
