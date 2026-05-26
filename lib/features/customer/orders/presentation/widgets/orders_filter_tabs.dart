import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/customer/orders/presentation/cubit/my_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersFilterTabs extends StatelessWidget {
  const OrdersFilterTabs({
    required this.currentFilter,
    required this.onFilterChanged,
    super.key,
  });

  final OrderFilter currentFilter;
  final ValueChanged<OrderFilter> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        itemCount: _tabs.length,
        separatorBuilder: (_, __) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          final tab = _tabs[index];
          final isSelected = currentFilter == tab.filter;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: InkWell(
              onTap: () => onFilterChanged(tab.filter),
              borderRadius: BorderRadius.circular(8.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextApp(
                    text: tab.label,
                    theme: context.textStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: isSelected
                          ? FontWeightHelper.bold
                          : FontWeightHelper.regular,
                      color: isSelected
                          ? context.color.bluePinkLight
                          : context.color.textColor!.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 2.h,
                    width: isSelected ? 30.w : 0,
                    decoration: BoxDecoration(
                      color: context.color.bluePinkLight,
                      borderRadius: BorderRadius.circular(1.r),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static const List<_FilterTab> _tabs = [
    _FilterTab('الكل', OrderFilter.all),
    _FilterTab('قيد التنفيذ', OrderFilter.active),
    _FilterTab('تم التوصيل', OrderFilter.delivered),
    _FilterTab('ملغية', OrderFilter.cancelled),
  ];
}

class _FilterTab {
  const _FilterTab(this.label, this.filter);
  final String label;
  final OrderFilter filter;
}
