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
import 'package:asroo_store/features/customer/checkout/presentation/widgets/order_review_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderReviewBody extends StatelessWidget {
  const OrderReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        state.whenOrNull(
          orderPlaced: () {
            context.read<CartCubit>().clearCart();
            Fluttertoast.showToast(
              msg: 'Order placed successfully!',
              backgroundColor: Colors.green,
            );
            context.pushNamedAndRemoveUntil(AppRoutes.mainCustomer);
          },
          error: (message) {
            Fluttertoast.showToast(
              msg: message,
              backgroundColor: Colors.red,
            );
          },
        );
      },
      builder: (context, state) {
        final checkoutCubit = context.read<CheckoutCubit>();
        final cartCubit = context.read<CartCubit>();
        final items = cartCubit.cartItems;

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
                    // Order Items
                    Container(
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
                            color: context.color.containerShadow1!
                                .withOpacity(0.2),
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
                                text: 'Order Items',
                                theme: context.textStyle.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeightHelper.bold,
                                  color: context.color.textColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          ...items.map(
                            (item) => OrderReviewItem(item: item),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Order Summary
                    Container(
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
                            color: context.color.containerShadow1!
                                .withOpacity(0.2),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: CartOrderSummary(
                        subtotal: cartCubit.subtotal,
                        shipping: cartCubit.shipping,
                        discount: cartCubit.discount,
                        total: cartCubit.total,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            // Confirm Order button
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 16.h,
              ),
              child: GestureDetector(
                onTap: () {
                  final isLoading = state is CheckoutLoadingState;
                  if (isLoading) return;
                  context.read<CheckoutCubit>().placeOrder(
                        cartItems: items,
                        subtotal: cartCubit.subtotal,
                        shipping: cartCubit.shipping,
                        discount: cartCubit.discount,
                        total: cartCubit.total,
                      );
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
                  child: state is CheckoutLoadingState
                      ? Center(
                          child: SizedBox(
                            height: 24.h,
                            width: 24.h,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImages.icLock,
                              height: 18.h,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            TextApp(
                              text: 'Confirm Order',
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
