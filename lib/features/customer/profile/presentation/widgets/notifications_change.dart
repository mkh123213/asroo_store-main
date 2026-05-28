import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsChange extends StatelessWidget {
  const NotificationsChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          SvgPicture.asset(
            AppImages.piNotifications,
            height: 22.h,
            colorFilter: ColorFilter.mode(
              context.color.textColor!,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextApp(
              text: context.translate(LangKeys.notifications),
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: FirebaseCloudMessaging().isNotificationSubscribe,
            builder: (_, value, __) {
              return Transform.scale(
                scale: 0.75,
                child: Switch.adaptive(
                  value: value,
                  inactiveTrackColor: const Color(0xff262626),
                  activeColor: context.color.bluePinkLight,
                  onChanged: (value) {
                    FirebaseCloudMessaging().controllerForUserSubscribe(context);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
