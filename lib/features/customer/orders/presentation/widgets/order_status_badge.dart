import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({required this.status, super.key});

  final String status;

  @override
  Widget build(BuildContext context) {
    final config = _getStatusConfig(status);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: config.color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 6.h,
            width: 6.w,
            decoration: BoxDecoration(
              color: config.color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 5.w),
          TextApp(
            text: config.label,
            theme: context.textStyle.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeightHelper.medium,
              color: config.color,
            ),
          ),
        ],
      ),
    );
  }

  _StatusConfig _getStatusConfig(String status) {
    switch (status) {
      case 'pending':
        return _StatusConfig('قيد الانتظار', Colors.orange);
      case 'confirmed':
        return _StatusConfig('تم التأكيد', Colors.green);
      case 'preparing':
        return _StatusConfig('قيد التجهيز', Colors.orange);
      case 'outForDelivery':
        return _StatusConfig('قيد التوصيل', Colors.blue);
      case 'delivered':
        return _StatusConfig('تم التوصيل', Colors.green);
      case 'cancelled':
        return _StatusConfig('ملغية', Colors.red);
      default:
        return _StatusConfig('غير معروف', Colors.grey);
    }
  }
}

class _StatusConfig {
  _StatusConfig(this.label, this.color);
  final String label;
  final Color color;
}
