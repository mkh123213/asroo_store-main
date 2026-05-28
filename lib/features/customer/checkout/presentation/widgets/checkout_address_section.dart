import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/checkout/data/models/shipping_address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutAddressSection extends StatelessWidget {
  const CheckoutAddressSection({required this.address, super.key});

  final ShippingAddressModel? address;

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
          // Header
          Row(
            children: [
              SvgPicture.asset(
                AppImages.icLocationPin,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  context.color.bluePinkLight!,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: TextApp(
                  text: 'Delivery Address',
                  theme: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.textColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.pushName(AppRoutes.shippingAddress),
                child: Row(
                  children: [
                    TextApp(
                      text: 'Change',
                      theme: context.textStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeightHelper.medium,
                        color: context.color.bluePinkLight,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    SvgPicture.asset(
                      AppImages.icChevronRight,
                      height: 12.h,
                      colorFilter: ColorFilter.mode(
                        context.color.bluePinkLight!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (address != null) ...[
            SizedBox(height: 12.h),
            _AddressDetailRow(
              icon: Icons.person_outline,
              text: address!.fullName,
              context: context,
            ),
            SizedBox(height: 6.h),
            _AddressDetailRow(
              icon: Icons.phone_outlined,
              text: address!.phoneNumber,
              context: context,
            ),
            SizedBox(height: 6.h),
            _AddressDetailRow(
              icon: Icons.location_on_outlined,
              text: '${address!.area}, ${address!.city}',
              context: context,
            ),
            SizedBox(height: 6.h),
            _AddressDetailRow(
              icon: Icons.home_outlined,
              text:
                  '${address!.street}, Building ${address!.buildingNo}, Floor ${address!.floor}',
              context: context,
            ),
          ] else ...[
            SizedBox(height: 12.h),
            TextApp(
              text: 'No address saved. Tap Change to add one.',
              theme: context.textStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeightHelper.regular,
                color: Colors.grey,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AddressDetailRow extends StatelessWidget {
  const _AddressDetailRow({
    required this.icon,
    required this.text,
    required this.context,
  });

  final IconData icon;
  final String text;
  final BuildContext context;

  @override
  Widget build(BuildContext buildContext) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: Colors.grey),
        SizedBox(width: 8.w),
        Expanded(
          child: TextApp(
            text: text,
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.regular,
              color: context.color.textColor?.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}
