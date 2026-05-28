import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/orders/presentation/cubit/admin_orders_cubit.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusDropdown extends StatelessWidget {
  const OrderStatusDropdown({required this.order, super.key});

  final OrderModel order;

  static const _statuses = [
    'pending',
    'confirmed',
    'preparing',
    'outForDelivery',
    'delivered',
    'cancelled',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderStatusCubit, UpdateOrderStatusState>(
      listener: (context, state) {
        if (state is UpdateOrderStatusSuccess) {
          ShowToast.showToastSuccessTop(
            message: 'Order status updated & customer notified',
          );
        } else if (state is UpdateOrderStatusError) {
          ShowToast.showToastErrorTop(message: state.error);
        }
      },
      builder: (context, state) {
        final isLoading = state is UpdateOrderStatusLoading &&
            state.orderId == order.id;

        if (isLoading) {
          return SizedBox(
            height: 24.h,
            width: 24.w,
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          );
        }

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: _statusColor(order.status).withOpacity(0.15),
            border: Border.all(
              color: _statusColor(order.status).withOpacity(0.4),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: order.status,
              dropdownColor: const Color(0xFF1E1E2E),
              icon: Icon(
                Icons.arrow_drop_down,
                color: _statusColor(order.status),
                size: 20.sp,
              ),
              items: _statuses.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: TextApp(
                    text: _statusLabel(status),
                    theme: context.textStyle.copyWith(
                      fontSize: 12.sp,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontWeight: FontWeightHelper.medium,
                      color: _statusColor(status),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newStatus) {
                if (newStatus != null && newStatus != order.status) {
                  final isOnlinePayment =
                      order.paymentMethod != 'cashOnDelivery';
                  final isUnpaid = order.paymentStatus != 'paid';
                  if (isOnlinePayment &&
                      isUnpaid &&
                      newStatus == 'confirmed') {
                    ShowToast.showToastErrorTop(
                      message:
                          'Cannot confirm: online payment is still pending',
                    );
                    return;
                  }
                  context.read<UpdateOrderStatusCubit>().updateStatus(
                        orderId: order.id,
                        customerId: order.customerId,
                        newStatus: newStatus,
                      );
                }
              },
            ),
          ),
        );
      },
    );
  }

  String _statusLabel(String status) {
    switch (status) {
      case 'pending':
        return 'Pending';
      case 'confirmed':
        return 'Confirmed';
      case 'preparing':
        return 'Preparing';
      case 'outForDelivery':
        return 'Out for Delivery';
      case 'delivered':
        return 'Delivered';
      case 'cancelled':
        return 'Cancelled';
      default:
        return status;
    }
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'confirmed':
        return Colors.blue;
      case 'preparing':
        return Colors.purple;
      case 'outForDelivery':
        return Colors.teal;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
