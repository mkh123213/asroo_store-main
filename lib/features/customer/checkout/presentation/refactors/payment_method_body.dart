import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:asroo_store/features/customer/checkout/presentation/widgets/payment_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodBody extends StatelessWidget {
  const PaymentMethodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();

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
                    PaymentOptionCard(
                      icon: AppImages.icCash,
                      title: 'Cash on Delivery',
                      subtitle: 'Pay when your order arrives',
                      isSelected:
                          cubit.paymentMethod == PaymentMethod.cashOnDelivery,
                      onTap: () => cubit
                          .selectPaymentMethod(PaymentMethod.cashOnDelivery),
                    ),
                    SizedBox(height: 14.h),
                    PaymentOptionCard(
                      icon: AppImages.icCreditCard,
                      title: 'Credit Card',
                      subtitle: 'Visa, Mastercard',
                      isSelected:
                          cubit.paymentMethod == PaymentMethod.creditCard,
                      onTap: () =>
                          cubit.selectPaymentMethod(PaymentMethod.creditCard),
                    ),
                    SizedBox(height: 14.h),
                    PaymentOptionCard(
                      icon: AppImages.icWallet,
                      title: 'Wallet',
                      subtitle: 'Pay using your wallet balance',
                      isSelected:
                          cubit.paymentMethod == PaymentMethod.wallet,
                      onTap: () =>
                          cubit.selectPaymentMethod(PaymentMethod.wallet),
                    ),
                    SizedBox(height: 40.h),
                    // Security notice
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.icLock,
                          height: 14.h,
                          colorFilter: ColorFilter.mode(
                            Colors.grey.shade400,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        TextApp(
                          text: 'Your payment information is secure',
                          theme: context.textStyle.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeightHelper.regular,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    TextApp(
                      text:
                          'We use industry-standard encryption to protect your data.',
                      theme: context.textStyle.copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeightHelper.regular,
                        color: Colors.grey.shade500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            // Save & Continue button
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 16.h,
              ),
              child: GestureDetector(
                onTap: () => context.pop(),
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
                        AppImages.icLock,
                        height: 18.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      TextApp(
                        text: 'Save & Continue',
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
