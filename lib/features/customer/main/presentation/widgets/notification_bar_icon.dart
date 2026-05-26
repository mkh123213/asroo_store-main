import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/notifications/data/models/notification_model.dart';
import 'package:asroo_store/features/customer/notifications/persentation/controller/notifcaiton_controller.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationBarIcon extends StatefulWidget {
  const NotificationBarIcon({required this.isSelected, super.key});

  final bool isSelected;

  @override
  State<NotificationBarIcon> createState() => _NotificationBarIconState();
}

class _NotificationBarIconState extends State<NotificationBarIcon> {
  late final Stream<List<NotificationModel>> _notificationStream;

  @override
  void initState() {
    super.initState();
    _notificationStream = NotificationController().getNotificationList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotificationModel>>(
      stream: _notificationStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final numberOfNotifi =
            snapshot.data!.where((e) => e.isSeen == false).length;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            badge.Badge(
              showBadge: numberOfNotifi != 0,
              badgeAnimation: const badge.BadgeAnimation.scale(),
              position: badge.BadgePosition.topEnd(end: -4.w, top: -8.h),
              badgeContent: TextApp(
                text: numberOfNotifi >= 9 ? '9+' : numberOfNotifi.toString(),
                theme: context.textStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeightHelper.bold,
                  fontSize: 11.sp,
                ),
                textAlign: TextAlign.center,
              ),
              badgeStyle: badge.BadgeStyle(
                badgeColor: Colors.pink,
                padding: EdgeInsets.all(5.h),
                elevation: 0,
              ),
              child: SvgPicture.asset(
                AppImages.notificationIcon,
                colorFilter: ColorFilter.mode(
                  widget.isSelected
                      ? context.color.navBarSelectedTab!
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
                height: 24.h,
              ),
            ),
            SizedBox(height: 6.h),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 5.h,
              width: 5.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isSelected
                    ? context.color.bluePinkDark
                    : Colors.transparent,
              ),
            ),
          ],
        );
      },
    );
  }
}
