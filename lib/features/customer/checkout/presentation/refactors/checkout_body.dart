import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/cart/presentation/cubit/cart_cubit.dart';
import 'package:asroo_store/features/customer/cart/presentation/widgets/cart_order_summary.dart';
import 'package:asroo_store/features/customer/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:asroo_store/features/customer/checkout/presentation/widgets/checkout_address_section.dart';
import 'package:asroo_store/features/customer/checkout/presentation/widgets/checkout_payment_section.dart';
import 'package:asroo_store/features/customer/checkout/presentation/widgets/checkout_summary_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final checkoutCubit = context.read<CheckoutCubit>();
        final cartCubit = context.read<CartCubit>();

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                child: Column(
                  children: [
                    // Delivery Address
                    CheckoutAddressSection(
                      address: checkoutCubit.savedAddress,
                    ),
                    SizedBox(height: 16.h),
                    // Payment Method
                    CheckoutPaymentSection(
                      paymentLabel: checkoutCubit.paymentMethodLabel,
                    ),
                    SizedBox(height: 16.h),
                    // Order Summary
                    CheckoutSummarySection(items: cartCubit.cartItems),
                    SizedBox(height: 16.h),
                    // Price Summary
                    CartOrderSummary(
                      subtotal: cartCubit.subtotal,
                      shipping: cartCubit.shipping,
                      discount: cartCubit.discount,
                      total: cartCubit.total,
                      showIcon: false,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            // Place Order button
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 16.h,
              ),
              child: GestureDetector(
                onTap: () {
                  context.pushName(AppRoutes.orderReview);
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
                        text: 'Place Order',
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
