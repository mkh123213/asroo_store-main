// ignore_for_file: deprecated_member_use

import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/core/utils/app_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildVersion extends StatelessWidget {
  const BuildVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          SvgPicture.asset(
            AppImages.piAppVersion,
            height: 22.h,
            colorFilter: ColorFilter.mode(
              context.color.textColor!,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextApp(
              text: context.translate(LangKeys.buildVersion),
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ),
          FutureBuilder<String>(
            future: AppInfo.getAppVersion(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return TextApp(
                  text: snapshot.data.toString(),
                  theme: context.textStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeightHelper.regular,
                    color: context.color.textColor!.withOpacity(0.6),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
