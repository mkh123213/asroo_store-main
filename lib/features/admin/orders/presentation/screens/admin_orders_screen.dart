import 'package:asroo_store/core/common/widgets/admin_app_bar.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/colors_dark.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/orders/presentation/cubit/admin_orders_cubit.dart';
import 'package:asroo_store/features/admin/orders/presentation/widgets/admin_order_card.dart';
import 'package:asroo_store/features/admin/orders/presentation/widgets/admin_orders_filter_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminOrdersScreen extends StatelessWidget {
  const AdminOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AdminOrdersCubit>()..loadOrders(),
        ),
        BlocProvider(
          create: (_) => sl<UpdateOrderStatusCubit>(),
        ),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Orders',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: _AdminOrdersBody(),
      ),
    );
  }
}

class _AdminOrdersBody extends StatelessWidget {
  const _AdminOrdersBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        BlocBuilder<AdminOrdersCubit, AdminOrdersState>(
          builder: (context, state) {
            return AdminOrdersFilterTabs(
              currentFilter: context.read<AdminOrdersCubit>().currentFilter,
              onFilterChanged: (filter) {
                context.read<AdminOrdersCubit>().changeFilter(filter);
              },
            );
          },
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: BlocBuilder<AdminOrdersCubit, AdminOrdersState>(
            builder: (context, state) {
              return switch (state) {
                AdminOrdersInitial() => const SizedBox.shrink(),
                AdminOrdersLoading() => const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                AdminOrdersLoaded(:final orders) => ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return AdminOrderCard(order: orders[index]);
                    },
                  ),
                AdminOrdersEmpty() => Center(
                    child: TextApp(
                      text: 'No orders found',
                      theme: context.textStyle.copyWith(
                        fontSize: 16.sp,
                        fontFamily: FontFamilyHelper.poppinsEnglish,
                        fontWeight: FontWeightHelper.medium,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                AdminOrdersFailure(:final error) => Center(
                    child: TextApp(
                      text: error,
                      theme: context.textStyle.copyWith(
                        fontSize: 14.sp,
                        fontFamily: FontFamilyHelper.poppinsEnglish,
                        color: Colors.red,
                      ),
                    ),
                  ),
              };
            },
          ),
        ),
      ],
    );
  }
}
