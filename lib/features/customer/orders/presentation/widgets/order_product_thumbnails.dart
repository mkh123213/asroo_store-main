import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderProductThumbnails extends StatelessWidget {
  const OrderProductThumbnails({required this.items, super.key});

  final List<OrderItemModel> items;

  static const int _maxVisible = 3;

  @override
  Widget build(BuildContext context) {
    final visibleItems = items.take(_maxVisible).toList();
    final extraCount = items.length - _maxVisible;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...visibleItems.map(
          (item) => Padding(
            padding: EdgeInsetsDirectional.only(end: 4.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                height: 36.h,
                width: 36.w,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  height: 36.h,
                  width: 36.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Icons.image, size: 16.sp, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
        if (extraCount > 0)
          Container(
            height: 36.h,
            width: 36.w,
            decoration: BoxDecoration(
              color: context.color.textColor!.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: TextApp(
                text: '+$extraCount',
                theme: context.textStyle.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
