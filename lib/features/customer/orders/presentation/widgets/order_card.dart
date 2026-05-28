// ignore_for_file: deprecated_member_use

import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';
import 'package:asroo_store/features/customer/orders/presentation/widgets/order_product_thumbnails.dart';
import 'package:asroo_store/features/customer/orders/presentation/widgets/order_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({required this.order, super.key});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToTracking(context),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: context.color.textColor!.withOpacity(0.04),
          border: Border.all(
            color: context.color.textColor!.withOpacity(0.06),
          ),
        ),
        child: Column(
          children: [
            _buildTopRow(context),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Divider(
                color: context.color.textColor!.withOpacity(0.08),
                height: 1,
              ),
            ),
            _buildMiddleRow(context),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Divider(
                color: context.color.textColor!.withOpacity(0.08),
                height: 1,
              ),
            ),
            _buildBottomRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRow(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 38.h,
          width: 38.w,
          decoration: BoxDecoration(
            color: context.color.bluePinkLight!.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImages.piOrdersBag,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                context.color.bluePinkLight!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: '#${order.orderId}',
                theme: context.textStyle.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              SizedBox(height: 2.h),
              TextApp(
                text: _formatDate(order.createdAt),
                theme: context.textStyle.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeightHelper.regular,
                  color: context.color.textColor!.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        OrderStatusBadge(status: order.status),
      ],
    );
  }

  Widget _buildMiddleRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: '${order.items.length} منتجات',
                theme: context.textStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeightHelper.medium,
                  color: context.color.textColor!.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  TextApp(
                    text: 'الإجمالي',
                    theme: context.textStyle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeightHelper.regular,
                      color: context.color.textColor!.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  TextApp(
                    text: '${order.total.toStringAsFixed(2)} ر.س',
                    theme: context.textStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        OrderProductThumbnails(items: order.items),
      ],
    );
  }

  Widget _buildBottomRow(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          _getPaymentIcon(),
          height: 18.h,
          colorFilter: ColorFilter.mode(
            context.color.textColor!.withOpacity(0.6),
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: TextApp(
            text: _getPaymentLabel(),
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.regular,
              color: context.color.textColor!.withOpacity(0.6),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _navigateToTracking(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextApp(
                text: 'عرض التفاصيل',
                theme: context.textStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeightHelper.medium,
                  color: context.color.bluePinkLight,
                ),
              ),
              SizedBox(width: 4.w),
              SvgPicture.asset(
                AppImages.piChevronRight,
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
    );
  }

  void _navigateToTracking(BuildContext context) {
    context.pushName(AppRoutes.orderTracking, arguments: order.id);
  }

  String _formatDate(DateTime date) {
    final formatter = DateFormat('d MMMM yyyy - h:mm a', 'ar');
    return formatter.format(date);
  }

  String _getPaymentIcon() {
    switch (order.paymentMethod) {
      case 'creditCard':
        return AppImages.icCreditCard;
      case 'wallet':
      case 'shamCash':
        return AppImages.icWallet;
      default:
        return AppImages.icCash;
    }
  }

  String _getPaymentLabel() {
    switch (order.paymentMethod) {
      case 'creditCard':
        return 'بطاقة ائتمان';
      case 'wallet':
        return 'المحفظة';
      case 'shamCash':
        return 'شام كاش';
      default:
        return 'الدفع عند الاستلام';
    }
  }
}
