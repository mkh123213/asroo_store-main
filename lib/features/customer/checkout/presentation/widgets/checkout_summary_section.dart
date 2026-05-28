import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/cart/data/models/cart_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutSummarySection extends StatelessWidget {
  const CheckoutSummarySection({required this.items, super.key});

  final List<CartItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
            color: context.color.containerShadow1!.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppImages.icBag,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  context.color.bluePinkLight!,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              TextApp(
                text: 'Order Summary',
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: context.color.textColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ...items.map((item) => _OrderItemRow(item: item)),
        ],
      ),
    );
  }
}

class _OrderItemRow extends StatelessWidget {
  const _OrderItemRow({required this.item});

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: item.image,
              height: 45.h,
              width: 45.w,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                height: 45.h,
                width: 45.w,
                color: Colors.grey.withOpacity(0.2),
                child: const Icon(Icons.image, size: 16),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: item.title,
                  theme: context.textStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeightHelper.medium,
                    color: context.color.textColor,
                  ),
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
                TextApp(
                  text: '${item.variant}  · x${item.quantity}',
                  theme: context.textStyle.copyWith(
                    fontSize: 10.sp,
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
              fontSize: 13.sp,
              fontWeight: FontWeightHelper.bold,
              color: context.color.bluePinkLight,
            ),
          ),
        ],
      ),
    );
  }
}
