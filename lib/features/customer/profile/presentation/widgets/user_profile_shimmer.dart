import 'package:asroo_store/core/common/loading/loading_shimmer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileShimmer extends StatelessWidget {
  const UserProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingShimmer(height: 80.h, width: 80.w, borderRadius: 45),
        SizedBox(height: 10.h),
        LoadingShimmer(height: 14.h, width: 120.w),
        SizedBox(height: 5.h),
        LoadingShimmer(height: 10.h, width: 180.w),
      ],
    );
  }
}
