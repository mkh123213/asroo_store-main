// ignore_for_file: deprecated_member_use

import 'package:asroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:asroo_store/core/common/dialogs/custom_dialogs.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/language/app_localizations.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageChange extends StatelessWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            CustomDialog.twoButtonDialog(
              context: context,
              textBody: context.translate(LangKeys.changeToTheLanguage),
              textButton1: context.translate(LangKeys.sure),
              textButton2: context.translate(LangKeys.cancel),
              isLoading: false,
              onPressed: () {
                selectLanguagesButton(context: context, cubit: cubit);
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppImages.piLanguage,
                  height: 22.h,
                  colorFilter: ColorFilter.mode(
                    context.color.textColor!,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: TextApp(
                    text: context.translate(LangKeys.languageTilte),
                    theme: context.textStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                ),
                TextApp(
                  text: context.translate(LangKeys.langCode),
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
      },
    );
  }

  void selectLanguagesButton({
    required BuildContext context,
    required AppCubit cubit,
  }) {
    if (AppLocalizations.of(context)!.isEnLocale) {
      cubit.toArabic();
    } else {
      cubit.toEnglish();
    }
    context.pop();
  }
}
