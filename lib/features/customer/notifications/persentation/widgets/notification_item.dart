import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    required this.title,
    required this.body,
    required this.createdAt,
    required this.isSeen,
    required this.onTapSelected,
    required this.onTapRemoved,
    super.key,
  });

  final String title;
  final String body;
  final String createdAt;
  final bool isSeen;
  final VoidCallback onTapSelected;
  final VoidCallback onTapRemoved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapSelected,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.all(14.w),
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
              color: context.color.containerShadow1!.withOpacity(0.3),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
            BoxShadow(
              color: context.color.containerShadow2!.withOpacity(0.3),
              offset: const Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seen/unseen dot indicator
            Padding(
              padding: EdgeInsets.only(top: 6.h, right: 8.w),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 10.h,
                width: 10.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSeen
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFFE53935),
                ),
              ),
            ),
            // Bell icon
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink.withOpacity(0.1),
                border: Border.all(
                  color: Colors.pinkAccent.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppImages.notificationIcon,
                  colorFilter: const ColorFilter.mode(
                    Colors.pinkAccent,
                    BlendMode.srcIn,
                  ),
                  height: 26.h,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: title,
                    theme: context.textStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: isSeen
                          ? Colors.grey
                          : context.color.textColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  TextApp(
                    text: body,
                    theme: context.textStyle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeightHelper.regular,
                      color: isSeen
                          ? Colors.grey
                          : context.color.textColor?.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14.sp,
                        color: Colors.green,
                      ),
                      SizedBox(width: 4.w),
                      TextApp(
                        text: createdAt,
                        theme: context.textStyle.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeightHelper.medium,
                          color: isSeen ? Colors.grey : Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Delete button
            GestureDetector(
              onTap: onTapRemoved,
              child: Padding(
                padding: EdgeInsets.only(top: 2.h, left: 8.w),
                child: Icon(
                  Icons.delete_outline,
                  color: isSeen ? Colors.grey : context.color.textColor?.withOpacity(0.5),
                  size: 22.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
