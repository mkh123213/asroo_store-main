import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/orders/presentation/widgets/order_status_dropdown.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AdminOrderCard extends StatelessWidget {
  const AdminOrderCard({required this.order, super.key});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: 10.h),
          _buildCustomerInfo(context),
          SizedBox(height: 10.h),
          _buildOrderDetails(context),
          SizedBox(height: 10.h),
          _buildPaymentRow(context),
          SizedBox(height: 12.h),
          _buildStatusSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: '#${order.orderId}',
          theme: context.textStyle.copyWith(
            fontSize: 16.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.bold,
            color: Colors.white,
          ),
        ),
        TextApp(
          text: _formatDate(order.createdAt),
          theme: context.textStyle.copyWith(
            fontSize: 11.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.regular,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerInfo(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.person_outline, color: Colors.white70, size: 18.sp),
        SizedBox(width: 6.w),
        TextApp(
          text: order.address.fullName,
          theme: context.textStyle.copyWith(
            fontSize: 13.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
            color: Colors.white70,
          ),
        ),
        SizedBox(width: 12.w),
        Icon(Icons.phone_outlined, color: Colors.white70, size: 18.sp),
        SizedBox(width: 4.w),
        TextApp(
          text: order.address.phone,
          theme: context.textStyle.copyWith(
            fontSize: 13.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.regular,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderDetails(BuildContext context) {
    return Row(
      children: [
        _infoChip(
          context,
          '${order.items.length} items',
          Icons.shopping_bag_outlined,
        ),
        SizedBox(width: 12.w),
        _infoChip(
          context,
          '${order.total.toStringAsFixed(2)}',
          Icons.attach_money,
        ),
        SizedBox(width: 12.w),
        _infoChip(
          context,
          _paymentLabel(order.paymentMethod),
          Icons.payment,
        ),
      ],
    );
  }

  Widget _infoChip(BuildContext context, String text, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white54, size: 16.sp),
        SizedBox(width: 4.w),
        TextApp(
          text: text,
          theme: context.textStyle.copyWith(
            fontSize: 12.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.regular,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Status:',
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.bold,
            color: Colors.white,
          ),
        ),
        OrderStatusDropdown(order: order),
      ],
    );
  }

  Widget _buildPaymentRow(BuildContext context) {
    final isCash = order.paymentMethod == 'cashOnDelivery';
    final isPaid = order.paymentStatus == 'paid';

    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: _paymentMethodColor(order.paymentMethod).withOpacity(0.15),
            border: Border.all(
              color: _paymentMethodColor(order.paymentMethod).withOpacity(0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isCash ? Icons.money : Icons.credit_card,
                color: _paymentMethodColor(order.paymentMethod),
                size: 14.sp,
              ),
              SizedBox(width: 4.w),
              TextApp(
                text: _paymentLabel(order.paymentMethod),
                theme: context.textStyle.copyWith(
                  fontSize: 11.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.medium,
                  color: _paymentMethodColor(order.paymentMethod),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: (isPaid ? Colors.green : Colors.orange).withOpacity(0.15),
            border: Border.all(
              color: (isPaid ? Colors.green : Colors.orange).withOpacity(0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isPaid ? Icons.check_circle_outline : Icons.access_time,
                color: isPaid ? Colors.green : Colors.orange,
                size: 14.sp,
              ),
              SizedBox(width: 4.w),
              TextApp(
                text: isPaid ? 'Paid' : 'Unpaid',
                theme: context.textStyle.copyWith(
                  fontSize: 11.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.medium,
                  color: isPaid ? Colors.green : Colors.orange,
                ),
              ),
            ],
          ),
        ),
        if (!isCash && !isPaid) ...[
          SizedBox(width: 8.w),
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.redAccent,
            size: 18.sp,
          ),
        ],
      ],
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('d MMM, y - h:mm a').format(date);
  }

  String _paymentLabel(String method) {
    switch (method) {
      case 'creditCard':
        return 'Credit Card';
      case 'wallet':
        return 'Wallet';
      case 'shamCash':
        return 'ShamCash';
      default:
        return 'Cash on Delivery';
    }
  }

  Color _paymentMethodColor(String method) {
    switch (method) {
      case 'creditCard':
        return Colors.blue;
      case 'wallet':
        return Colors.purple;
      case 'shamCash':
        return Colors.green;
      default:
        return Colors.teal;
    }
  }
}
