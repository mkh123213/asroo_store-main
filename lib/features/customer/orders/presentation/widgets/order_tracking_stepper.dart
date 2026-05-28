import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderTrackingStepper extends StatelessWidget {
  const OrderTrackingStepper({required this.status, super.key});

  final String status;

  static const _steps = [
    _Step('تم التأكيد', AppImages.odCheckCircle),
    _Step('قيد التحضير', AppImages.odPackageBox),
    _Step('قيد التوصيل', AppImages.odTruck),
    _Step('تم التسليم', AppImages.odDeliveredBox),
  ];

  int get _completedCount {
    switch (status) {
      case 'confirmed':
        return 1;
      case 'preparing':
        return 2;
      case 'outForDelivery':
        return 3;
      case 'delivered':
        return 4;
      default:
        return 0;
    }
  }

  bool get _isCancelled => status == 'cancelled';

  @override
  Widget build(BuildContext context) {
    final accent = context.color.bluePinkLight!;
    final gray = context.color.textColor!.withOpacity(0.15);
    final completed = _completedCount;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: context.color.textColor!.withOpacity(0.04),
        border: Border.all(
          color: context.color.textColor!.withOpacity(0.08),
        ),
      ),
      child: Row(
        children: List.generate(_steps.length * 2 - 1, (i) {
          if (i.isOdd) {
            final lineIndex = i ~/ 2;
            final isActive = !_isCancelled && lineIndex < completed - 1;
            return Expanded(
              child: Container(
                height: 2.h,
                color: isActive ? accent : gray,
              ),
            );
          }
          final stepIndex = i ~/ 2;
          final step = _steps[stepIndex];
          final isCompleted = !_isCancelled && stepIndex < completed;
          final isActive = !_isCancelled && stepIndex == completed - 1;

          return _buildStep(
            context,
            step: step,
            isCompleted: isCompleted,
            isActive: isActive,
            isCancelled: _isCancelled,
            accent: accent,
            gray: gray,
          );
        }),
      ),
    );
  }

  Widget _buildStep(
    BuildContext context, {
    required _Step step,
    required bool isCompleted,
    required bool isActive,
    required bool isCancelled,
    required Color accent,
    required Color gray,
  }) {
    final iconColor = isCompleted ? Colors.white : gray;
    final bgColor = isCompleted ? accent : Colors.transparent;
    final borderColor = isCompleted ? accent : gray;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor,
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Center(
            child: isCompleted
                ? SvgPicture.asset(
                    AppImages.odStatusCheckFilled,
                    height: 16.h,
                    colorFilter: ColorFilter.mode(
                      iconColor,
                      BlendMode.srcIn,
                    ),
                  )
                : SvgPicture.asset(
                    step.icon,
                    height: 14.h,
                    colorFilter: ColorFilter.mode(
                      isCancelled
                          ? Colors.red.withOpacity(0.4)
                          : context.color.textColor!.withOpacity(0.3),
                      BlendMode.srcIn,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          step.label,
          style: context.textStyle.copyWith(
            fontSize: 9.sp,
            fontWeight:
                isActive ? FontWeightHelper.bold : FontWeightHelper.regular,
            color: isCompleted
                ? accent
                : context.color.textColor!.withOpacity(0.4),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _Step {
  const _Step(this.label, this.icon);
  final String label;
  final String icon;
}
