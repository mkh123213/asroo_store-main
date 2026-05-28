import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartOrderSummary extends StatelessWidget {
  const CartOrderSummary({
    required this.subtotal,
    required this.shipping,
    required this.discount,
    required this.total,
    this.showIcon = true,
    super.key,
  });

  final double subtotal;
  final double shipping;
  final double discount;
  final double total;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showIcon)
          Row(
            children: [
              SvgPicture.asset(
                AppImages.icReceipt,
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
                  fontSize: 15.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: context.color.textColor,
                ),
              ),
            ],
          ),
        if (showIcon) SizedBox(height: 12.h),
        _SummaryRow(
          label: 'Subtotal',
          value: '\$${subtotal.toStringAsFixed(2)}',
          context: context,
        ),
        SizedBox(height: 6.h),
        _SummaryRow(
          label: 'Shipping',
          value: '\$${shipping.toStringAsFixed(2)}',
          context: context,
        ),
        SizedBox(height: 6.h),
        _SummaryRow(
          label: 'Discount',
          value: '-\$${discount.abs().toStringAsFixed(2)}',
          context: context,
          valueColor: Colors.green,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Divider(
            color: context.color.textColor!.withOpacity(0.1),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextApp(
              text: 'Total',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
                color: context.color.textColor,
              ),
            ),
            TextApp(
              text: '\$${total.toStringAsFixed(2)}',
              theme: context.textStyle.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.bold,
                color: context.color.bluePinkLight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    required this.context,
    this.valueColor,
  });

  final String label;
  final String value;
  final BuildContext context;
  final Color? valueColor;

  @override
  Widget build(BuildContext buildContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: label,
          theme: context.textStyle.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeightHelper.regular,
            color: Colors.grey,
          ),
        ),
        TextApp(
          text: value,
          theme: context.textStyle.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeightHelper.medium,
            color: valueColor ?? context.color.textColor,
          ),
        ),
      ],
    );
  }
}
