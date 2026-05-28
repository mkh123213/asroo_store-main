import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconTapNavBar extends StatelessWidget {
  const IconTapNavBar({
    required this.onTap,
    required this.icon,
    required this.isSelected,
    super.key,
  });
  final VoidCallback onTap;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              isSelected ? context.color.navBarSelectedTab! : Colors.grey,
              BlendMode.srcIn,
            ),
            height: 24.h,
          ),
          SizedBox(height: 6.h),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 5.h,
            width: 5.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? context.color.bluePinkDark
                  : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
