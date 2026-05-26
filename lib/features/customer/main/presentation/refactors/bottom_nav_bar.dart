import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/enums/nav_bar_enum.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/main/presentation/cubit/main_cubit.dart';
import 'package:asroo_store/features/customer/main/presentation/widgets/icon_tap_nav_bar.dart';
import 'package:asroo_store/features/customer/main/presentation/widgets/notification_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 800,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 16.h,
        ),
        child: Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: context.color.navBarbg,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: context.color.textColor!.withOpacity(0.08),
            ),
            boxShadow: [
              BoxShadow(
                color: context.color.containerShadow1!.withOpacity(0.15),
                offset: const Offset(0, 8),
                blurRadius: 24,
              ),
            ],
          ),
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              final cubit = context.read<MainCubit>();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cart
                  IconTapNavBar(
                    icon: AppImages.carShop,
                    isSelected: false,
                    onTap: () {
                      context.pushName(AppRoutes.cart);
                    },
                  ),
                  // Profile
                  IconTapNavBar(
                    icon: AppImages.profileTab,
                    isSelected: cubit.navBarEnum == NavBarEnum.profile,
                    onTap: () {
                      cubit.selectedNavBarIcons(NavBarEnum.profile);
                    },
                  ),
                  // Favourites
                  IconTapNavBar(
                    icon: AppImages.favouritesTab,
                    isSelected: cubit.navBarEnum == NavBarEnum.favorites,
                    onTap: () {
                      cubit.selectedNavBarIcons(NavBarEnum.favorites);
                    },
                  ),
                  // Notifications
                  GestureDetector(
                    onTap: () {
                      cubit.selectedNavBarIcons(NavBarEnum.notifications);
                    },
                    child: NotificationBarIcon(
                      isSelected:
                          cubit.navBarEnum == NavBarEnum.notifications,
                    ),
                  ),
                  // Home (house icon)
                  IconTapNavBar(
                    icon: AppImages.homeTab,
                    isSelected: cubit.navBarEnum == NavBarEnum.home,
                    onTap: () {
                      cubit.selectedNavBarIcons(NavBarEnum.home);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
