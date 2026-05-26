import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/cart/presentation/cubit/cart_cubit.dart';
import 'package:asroo_store/features/customer/cart/presentation/widgets/cart_item_widget.dart';
import 'package:asroo_store/features/customer/cart/presentation/widgets/cart_order_summary.dart';
import 'package:asroo_store/features/customer/cart/presentation/widgets/cart_promo_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        final items = cubit.cartItems;

        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppImages.icCart,
                  height: 100.h,
                  colorFilter: ColorFilter.mode(
                    context.color.textColor!.withOpacity(0.3),
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: 16.h),
                TextApp(
                  text: 'Your cart is empty',
                  theme: context.textStyle.copyWith(
                    fontWeight: FontWeightHelper.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cart items
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        return CartItemWidget(item: items[index]);
                      },
                    ),
                    SizedBox(height: 16.h),
                    // Promo code
                    const CartPromoCode(),
                    SizedBox(height: 20.h),
                    // Order summary
                    CartOrderSummary(
                      subtotal: cubit.subtotal,
                      shipping: cubit.shipping,
                      discount: cubit.discount,
                      total: cubit.total,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            // Proceed to Checkout button
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 16.h,
              ),
              child: GestureDetector(
                onTap: () {
                  context.pushName(AppRoutes.checkout);
                },
                child: Container(
                  height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    gradient: LinearGradient(
                      colors: [
                        context.color.bluePinkLight!,
                        context.color.bluePinkDark!,
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImages.icBag,
                        height: 20.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      TextApp(
                        text: 'Proceed to Checkout',
                        theme: context.textStyle.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeightHelper.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(
                        AppImages.icChevronRight,
                        height: 16.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
