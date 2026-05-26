import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/customer/cart/data/models/cart_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderReviewItem extends StatelessWidget {
  const OrderReviewItem({required this.item, super.key});

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: item.image,
              height: 60.h,
              width: 60.w,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                height: 60.h,
                width: 60.w,
                color: Colors.grey.withOpacity(0.2),
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: item.title,
                  theme: context.textStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.textColor,
                  ),
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                TextApp(
                  text: '${item.variant}  · x${item.quantity}',
                  theme: context.textStyle.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeightHelper.regular,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          TextApp(
            text: '\$${(item.price * item.quantity).toStringAsFixed(2)}',
            theme: context.textStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeightHelper.bold,
              color: context.color.bluePinkLight,
            ),
          ),
        ],
      ),
    );
  }
}
