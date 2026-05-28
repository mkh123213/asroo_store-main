// ignore_for_file: deprecated_member_use

import 'package:asroo_store/core/common/loading/loading_shimmer.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_address_model.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_item_model.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';
import 'package:asroo_store/features/customer/orders/presentation/cubit/order_tracking_cubit.dart';
import 'package:asroo_store/features/customer/orders/presentation/widgets/order_tracking_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderTrackingBody extends StatelessWidget {
  const OrderTrackingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTrackingCubit, OrderTrackingState>(
      builder: (context, state) {
        if (state is OrderTrackingLoading) {
          return _buildLoading(context);
        }
        if (state is OrderTrackingError) {
          return _buildError(context, state.message);
        }
        if (state is OrderTrackingLoaded) {
          return _buildContent(context, state.order);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          SizedBox(height: 60.h),
          LoadingShimmer(
            height: 80.h,
            width: double.infinity,
            borderRadius: 16,
          ),
          SizedBox(height: 16.h),
          LoadingShimmer(
            height: 90.h,
            width: double.infinity,
            borderRadius: 16,
          ),
          SizedBox(height: 16.h),
          LoadingShimmer(
            height: 120.h,
            width: double.infinity,
            borderRadius: 16,
          ),
          SizedBox(height: 16.h),
          LoadingShimmer(
            height: 100.h,
            width: double.infinity,
            borderRadius: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 60.sp,
              color: context.color.textColor!.withOpacity(0.4),
            ),
            SizedBox(height: 16.h),
            TextApp(
              text: message,
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: context.color.bluePinkLight,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: TextApp(
                  text: 'رجوع',
                  theme: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.medium,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, OrderModel order) {
    return Column(
      children: [
        _buildAppBar(context),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 8.h),
                _buildOrderHeader(context, order),
                SizedBox(height: 16.h),
                OrderTrackingStepper(status: order.status),
                SizedBox(height: 12.h),
                _buildDateRow(context, order),
                SizedBox(height: 16.h),
                _buildAddressCard(context, order),
                SizedBox(height: 12.h),
                _buildPaymentCard(context, order),
                SizedBox(height: 12.h),
                _buildProductsCard(context, order),
                SizedBox(height: 12.h),
                _buildSummaryCard(context, order),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
        _buildBottomBar(context, order),
      ],
    );
  }

  // ─── App Bar ───

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: context.color.textColor!.withOpacity(0.06),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppImages.odBack,
                  height: 18.h,
                  colorFilter: ColorFilter.mode(
                    context.color.textColor!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TextApp(
                  text: 'تفاصيل الطلب',
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.textColor,
                  ),
                ),
                SizedBox(height: 2.h),
                TextApp(
                  text: 'عرض حالة الطلب ومعلوماته',
                  theme: context.textStyle.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeightHelper.regular,
                    color: context.color.textColor!.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 40.w),
        ],
      ),
    );
  }

  // ─── Order Header ───

  Widget _buildOrderHeader(BuildContext context, OrderModel order) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStatusBadge(context, order.status),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextApp(
              text: 'رقم الطلب',
              theme: context.textStyle.copyWith(
                fontSize: 11.sp,
                fontWeight: FontWeightHelper.regular,
                color: context.color.textColor!.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 2.h),
            TextApp(
              text: '#${_displayOrderId(order)}',
              theme: context.textStyle.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeightHelper.bold,
                color: context.color.bluePinkLight,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status) {
    final info = _statusInfo(status);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: info.color.withOpacity(0.12),
        border: Border.all(color: info.color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            info.icon,
            height: 16.h,
            colorFilter: ColorFilter.mode(info.color, BlendMode.srcIn),
          ),
          SizedBox(width: 6.w),
          TextApp(
            text: info.label,
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.bold,
              color: info.color,
            ),
          ),
        ],
      ),
    );
  }

  // ─── Date Row ───

  Widget _buildDateRow(BuildContext context, OrderModel order) {
    final formatted =
        DateFormat('d MMMM yyyy - h:mm a', 'ar').format(order.createdAt);
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.odCalendar,
          height: 16.h,
          colorFilter: ColorFilter.mode(
            context.color.textColor!.withOpacity(0.5),
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 8.w),
        TextApp(
          text: formatted,
          theme: context.textStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeightHelper.regular,
            color: context.color.textColor!.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  // ─── Address Card ───

  Widget _buildAddressCard(BuildContext context, OrderModel order) {
    final addr = order.address;
    final hasAddress = addr.fullName.isNotEmpty;

    return _card(
      context,
      icon: AppImages.odLocationPin,
      title: 'عنوان التوصيل',
      child: hasAddress
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: addr.fullName,
                  theme: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.textColor,
                  ),
                ),
                SizedBox(height: 6.h),
                TextApp(
                  text: _formatAddress(addr),
                  theme: context.textStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeightHelper.regular,
                    color: context.color.textColor!.withOpacity(0.6),
                  ),
                  maxLines: 3,
                ),
                if (addr.phone.isNotEmpty) ...[
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.odPhone,
                        height: 14.h,
                        colorFilter: ColorFilter.mode(
                          context.color.textColor!.withOpacity(0.5),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      TextApp(
                        text: addr.phone,
                        theme: context.textStyle.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeightHelper.regular,
                          color: context.color.textColor!.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            )
          : TextApp(
              text: 'لا يوجد عنوان',
              theme: context.textStyle.copyWith(
                fontSize: 12.sp,
                color: context.color.textColor!.withOpacity(0.4),
              ),
            ),
    );
  }

  String _formatAddress(OrderAddressModel addr) {
    final parts = <String>[
      if (addr.street.isNotEmpty) addr.street,
      if (addr.area.isNotEmpty) addr.area,
      if (addr.city.isNotEmpty) addr.city,
    ];
    final line1 = parts.join('، ');
    final details = <String>[
      if (addr.buildingNo.isNotEmpty) 'مبنى ${addr.buildingNo}',
      if (addr.floorOrApartment.isNotEmpty) 'طابق ${addr.floorOrApartment}',
    ];
    if (details.isEmpty) return line1;
    return '$line1\n${details.join(' - ')}';
  }

  // ─── Payment Card ───

  Widget _buildPaymentCard(BuildContext context, OrderModel order) {
    final info = _paymentInfo(order.paymentMethod);
    return _card(
      context,
      icon: AppImages.odReceipt,
      title: 'طريقة الدفع',
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: context.color.bluePinkLight!.withOpacity(0.1),
            ),
            child: Center(
              child: SvgPicture.asset(
                info.icon,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  context.color.bluePinkLight!,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: info.label,
                theme: context.textStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: context.color.textColor,
                ),
              ),
              SizedBox(height: 2.h),
              TextApp(
                text: info.subtitle,
                theme: context.textStyle.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeightHelper.regular,
                  color: context.color.textColor!.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Products Card ───

  Widget _buildProductsCard(BuildContext context, OrderModel order) {
    return _card(
      context,
      icon: AppImages.odProductsBag,
      title: 'المنتجات',
      child: Column(
        children: [
          for (int i = 0; i < order.items.length; i++) ...[
            if (i > 0) Divider(
              color: context.color.textColor!.withOpacity(0.06),
              height: 16.h,
            ),
            _buildProductItem(context, order.items[i]),
          ],
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, OrderItemModel item) {
    return Row(
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: context.color.textColor!.withOpacity(0.06),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Center(
                child: SvgPicture.asset(
                  AppImages.odProductsBag,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(
                    context.color.textColor!.withOpacity(0.3),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: item.name,
                theme: context.textStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeightHelper.medium,
                  color: context.color.textColor,
                ),
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              TextApp(
                text: '${item.price.toStringAsFixed(0)} ر.س',
                theme: context.textStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: context.color.bluePinkLight,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: context.color.textColor!.withOpacity(0.06),
          ),
          child: TextApp(
            text: '×${item.quantity}',
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.bold,
              color: context.color.textColor!.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }

  // ─── Summary Card ───

  Widget _buildSummaryCard(BuildContext context, OrderModel order) {
    return _card(
      context,
      icon: AppImages.odReceipt,
      title: 'ملخص السعر',
      child: Column(
        children: [
          _summaryRow(
            context,
            'المجموع الفرعي',
            '${order.subtotal.toStringAsFixed(0)} ر.س',
          ),
          SizedBox(height: 8.h),
          _summaryRow(
            context,
            'رسوم التوصيل',
            '${order.deliveryFee.toStringAsFixed(0)} ر.س',
          ),
          if (order.discount != 0) ...[
            SizedBox(height: 8.h),
            _summaryRow(
              context,
              'خصم',
              '${order.discount.toStringAsFixed(0)} ر.س',
              valueColor: Colors.green,
            ),
          ],
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(
              color: context.color.textColor!.withOpacity(0.08),
              height: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp(
                text: 'الإجمالي',
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: context.color.textColor,
                ),
              ),
              TextApp(
                text: '${order.total.toStringAsFixed(0)} ر.س',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: context.color.bluePinkLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    BuildContext context,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: label,
          theme: context.textStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeightHelper.regular,
            color: context.color.textColor!.withOpacity(0.6),
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

  // ─── Bottom Bar ───

  Widget _buildBottomBar(BuildContext context, OrderModel order) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: 12.h,
        top: 12.h,
      ),
      decoration: BoxDecoration(
        color: context.color.mainColor,
        boxShadow: [
          BoxShadow(
            color: context.color.textColor!.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _contactSupport(),
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: context.color.textColor!.withOpacity(0.15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.odSupportHeadset,
                      height: 18.h,
                      colorFilter: ColorFilter.mode(
                        context.color.textColor!.withOpacity(0.7),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    TextApp(
                      text: 'التواصل مع الدعم',
                      theme: context.textStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeightHelper.medium,
                        color: context.color.textColor!.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
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
                      AppImages.odTruck,
                      height: 18.h,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    TextApp(
                      text: 'تتبع الشحنة',
                      theme: context.textStyle.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeightHelper.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Reusable Card ───

  Widget _card(
    BuildContext context, {
    required String icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: context.color.textColor!.withOpacity(0.04),
        border: Border.all(
          color: context.color.textColor!.withOpacity(0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  context.color.bluePinkLight!,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              TextApp(
                text: title,
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: context.color.textColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(
              color: context.color.textColor!.withOpacity(0.08),
              height: 1,
            ),
          ),
          child,
        ],
      ),
    );
  }

  // ─── Helpers ───

  String _displayOrderId(OrderModel order) {
    if (order.orderId.isNotEmpty) return order.orderId;
    return order.id.length > 8
        ? order.id.substring(0, 8).toUpperCase()
        : order.id.toUpperCase();
  }

  _StatusInfo _statusInfo(String status) {
    switch (status) {
      case 'confirmed':
        return _StatusInfo(
          'تم التأكيد',
          AppImages.odCheckCircle,
          const Color(0xFF3D7BFF),
        );
      case 'preparing':
        return _StatusInfo(
          'قيد التحضير',
          AppImages.odPackageBox,
          const Color(0xFFF59E0B),
        );
      case 'outForDelivery':
        return _StatusInfo(
          'قيد التوصيل',
          AppImages.odTruck,
          const Color(0xFF3D7BFF),
        );
      case 'delivered':
        return _StatusInfo(
          'تم التسليم',
          AppImages.odDeliveredBox,
          const Color(0xFF22C55E),
        );
      case 'cancelled':
        return _StatusInfo(
          'ملغي',
          AppImages.odCancelCircle,
          const Color(0xFFEF4444),
        );
      default:
        return _StatusInfo(
          'قيد المراجعة',
          AppImages.odOrderBag,
          const Color(0xFFF59E0B),
        );
    }
  }

  _PaymentInfo _paymentInfo(String method) {
    switch (method) {
      case 'creditCard':
        return _PaymentInfo(
          'بطاقة ائتمان',
          'خصم مباشر من البطاقة',
          AppImages.odCreditCard,
        );
      case 'wallet':
        return _PaymentInfo(
          'المحفظة',
          'الدفع من رصيد المحفظة',
          AppImages.odWallet,
        );
      case 'shamCash':
        return _PaymentInfo(
          'شام كاش',
          'الدفع عبر شام كاش',
          AppImages.odWallet,
        );
      default:
        return _PaymentInfo(
          'الدفع عند الاستلام',
          'ادفع نقدًا عند التوصيل',
          AppImages.odCash,
        );
    }
  }

  void _contactSupport() {
    Fluttertoast.showToast(
      msg: 'سيتم التواصل معك قريبًا',
      backgroundColor: const Color(0xFF3D7BFF),
    );
  }
}

class _StatusInfo {
  const _StatusInfo(this.label, this.icon, this.color);
  final String label;
  final String icon;
  final Color color;
}

class _PaymentInfo {
  const _PaymentInfo(this.label, this.subtitle, this.icon);
  final String label;
  final String subtitle;
  final String icon;
}
