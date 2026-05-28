import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminOrdersFilterTabs extends StatelessWidget {
  const AdminOrdersFilterTabs({
    required this.currentFilter,
    required this.onFilterChanged,
    super.key,
  });

  final String currentFilter;
  final void Function(String) onFilterChanged;

  static const _filters = [
    ('all', 'All'),
    ('pending', 'Pending'),
    ('confirmed', 'Confirmed'),
    ('preparing', 'Preparing'),
    ('outForDelivery', 'Delivery'),
    ('delivered', 'Delivered'),
    ('cancelled', 'Cancelled'),
    ('cashOnDelivery', 'COD'),
    ('creditCard', 'Card'),
    ('wallet', 'Wallet'),
    ('shamCash', 'ShamCash'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        itemCount: _filters.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final isSelected = currentFilter == filter.$1;
          return GestureDetector(
            onTap: () => onFilterChanged(filter.$1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: isSelected
                    ? Colors.white.withOpacity(0.15)
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? Colors.white.withOpacity(0.3)
                      : Colors.white.withOpacity(0.1),
                ),
              ),
              alignment: Alignment.center,
              child: TextApp(
                text: filter.$2,
                theme: context.textStyle.copyWith(
                  fontSize: 12.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight:
                      isSelected ? FontWeightHelper.bold : FontWeightHelper.regular,
                  color: isSelected ? Colors.white : Colors.white54,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
