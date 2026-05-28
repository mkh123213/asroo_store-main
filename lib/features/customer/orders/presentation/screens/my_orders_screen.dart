// ignore_for_file: deprecated_member_use

import 'package:asroo_store/core/common/loading/loading_shimmer.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/orders/data/models/order_model.dart';
import 'package:asroo_store/features/customer/orders/presentation/cubit/my_orders_cubit.dart';
import 'package:asroo_store/features/customer/orders/presentation/widgets/empty_orders_view.dart';
import 'package:asroo_store/features/customer/orders/presentation/widgets/order_card.dart';
import 'package:asroo_store/features/customer/orders/presentation/widgets/orders_filter_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          BlocBuilder<MyOrdersCubit, MyOrdersState>(
            builder: (context, state) {
              return OrdersFilterTabs(
                currentFilter:
                    context.read<MyOrdersCubit>().currentFilter,
                onFilterChanged: (filter) {
                  context.read<MyOrdersCubit>().changeFilter(filter);
                },
              );
            },
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => _buildLoadingState(),
                  loaded: (orders) => _buildOrdersList(context, orders),
                  empty: () => const EmptyOrdersView(),
                  failure: (error) => _buildErrorState(context, error),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: SvgPicture.asset(
          AppImages.backButton,
          height: 22.h,
          colorFilter: ColorFilter.mode(
            context.color.textColor!,
            BlendMode.srcIn,
          ),
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          TextApp(
            text: 'طلباتي',
            theme: context.textStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          SizedBox(height: 2.h),
          TextApp(
            text: 'عرض ومتابعة جميع طلباتك',
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.regular,
              color: context.color.textColor!.withOpacity(0.5),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppImages.search,
            height: 22.h,
            colorFilter: ColorFilter.mode(
              context.color.textColor!,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      itemCount: 4,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (_, __) => LoadingShimmer(
        height: 160.h,
        width: double.infinity,
        borderRadius: 16,
      ),
    );
  }

  Widget _buildOrdersList(
    BuildContext context,
    List<OrderModel> orders,
  ) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      itemCount: orders.length + 1,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        if (index == orders.length) {
          return const EmptyOrdersView(isFooter: true);
        }
        return OrderCard(order: orders[index]);
      },
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
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
              text: 'حدث خطأ أثناء تحميل الطلبات',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () => context.read<MyOrdersCubit>().loadOrders(),
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
                  text: 'إعادة المحاولة',
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
}
