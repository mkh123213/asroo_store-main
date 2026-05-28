import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/cart/data/models/cart_item_model.dart';
import 'package:asroo_store/features/customer/cart/presentation/cubit/cart_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({required this.item, super.key});

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
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
      child: Row(
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: item.image,
              height: 80.h,
              width: 80.w,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                height: 80.h,
                width: 80.w,
                color: Colors.grey.withOpacity(0.2),
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextApp(
                        text: item.title,
                        theme: context.textStyle.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeightHelper.bold,
                          color: context.color.textColor,
                        ),
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context
                          .read<CartCubit>()
                          .removeFromCart(item.productId),
                      child: SvgPicture.asset(
                        AppImages.icTrash,
                        height: 18.h,
                        colorFilter: ColorFilter.mode(
                          Colors.grey.shade400,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                TextApp(
                  text: item.variant,
                  theme: context.textStyle.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeightHelper.regular,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    Row(
                      children: [
                        if (item.originalPrice > item.price)
                          Padding(
                            padding: EdgeInsets.only(right: 6.w),
                            child: TextApp(
                              text:
                                  '\$${item.originalPrice.toStringAsFixed(2)}',
                              theme: context.textStyle.copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeightHelper.regular,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                        TextApp(
                          text: '\$${item.price.toStringAsFixed(2)}',
                          theme: context.textStyle.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeightHelper.bold,
                            color: context.color.bluePinkLight,
                          ),
                        ),
                      ],
                    ),
                    // Quantity controls
                    Row(
                      children: [
                        _QuantityButton(
                          icon: AppImages.icMinus,
                          onTap: () => context
                              .read<CartCubit>()
                              .decrementQuantity(item.productId),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: TextApp(
                            text: '${item.quantity}',
                            theme: context.textStyle.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeightHelper.bold,
                              color: context.color.textColor,
                            ),
                          ),
                        ),
                        _QuantityButton(
                          icon: AppImages.icPlus,
                          onTap: () => context
                              .read<CartCubit>()
                              .incrementQuantity(item.productId),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, required this.onTap});

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28.h,
        width: 28.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: context.color.textColor!.withOpacity(0.15),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            height: 12.h,
            colorFilter: ColorFilter.mode(
              context.color.textColor!,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
