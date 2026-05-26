// ignore_for_file: deprecated_member_use

import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/language/lang_keys.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:asroo_store/features/customer/profile/presentation/widgets/build_developer.dart';
import 'package:asroo_store/features/customer/profile/presentation/widgets/build_version.dart';
import 'package:asroo_store/features/customer/profile/presentation/widgets/dark_mode_change.dart';
import 'package:asroo_store/features/customer/profile/presentation/widgets/language_change.dart';
import 'package:asroo_store/features/customer/profile/presentation/widgets/logout_widget.dart';
import 'package:asroo_store/features/customer/profile/presentation/widgets/notifications_change.dart';
import 'package:asroo_store/features/customer/profile/presentation/widgets/user_profile_info.dart';
import 'package:asroo_store/features/customer/profile/presentation/widgets/user_profile_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return state.when(
                    loading: UserProfileShimmer.new,
                    success: (userInfoData) => UserProfileInfo(
                      userInfo: userInfoData,
                    ),
                    error: Text.new,
                  );
                },
              ),
            ),
            SizedBox(height: 25.h),
            CustomFadeInRight(
              duration: 400,
              child: _buildMyOrdersSection(context),
            ),
            SizedBox(height: 20.h),
            CustomFadeInRight(
              duration: 400,
              child: _buildMyAccountSection(context),
            ),
            SizedBox(height: 20.h),
            CustomFadeInRight(
              duration: 400,
              child: _buildAppFeaturesSection(context),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required String icon,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 20.h,
            colorFilter: ColorFilter.mode(
              context.color.bluePinkLight!,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8.w),
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required List<Widget> children,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: context.color.textColor!.withOpacity(0.06),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      color: context.color.textColor!.withOpacity(0.1),
      height: 1,
    );
  }

  Widget _buildMyOrdersSection(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushName(AppRoutes.myOrders),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            context,
            icon: AppImages.piOrdersBag,
            title: context.translate(LangKeys.myOrders),
          ),
          TextApp(
            text: context.translate(LangKeys.ordersSubtitle),
            theme: context.textStyle.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeightHelper.regular,
              color: context.color.textColor!.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  value: '8',
                  label: context.translate(LangKeys.orderCount),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _buildStatCard(
                  context,
                  value: '1',
                  label: context.translate(LangKeys.shippingReceipts),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _buildStatCard(
                  context,
                  value: '2',
                  label: context.translate(LangKeys.pending),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String value,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: context.color.textColor!.withOpacity(0.06),
      ),
      child: Column(
        children: [
          TextApp(
            text: value,
            theme: context.textStyle.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          SizedBox(height: 4.h),
          TextApp(
            text: label,
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.regular,
              color: context.color.textColor!.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMyAccountSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          context,
          icon: AppImages.piSettings,
          title: context.translate(LangKeys.myAccount),
        ),
        _buildSectionCard(
          context,
          children: [
            _buildAccountMenuItem(
              context,
              icon: AppImages.piLocation,
              title: context.translate(LangKeys.addresses),
            ),
            _buildDivider(context),
            _buildAccountMenuItem(
              context,
              icon: AppImages.piPaymentCard,
              title: context.translate(LangKeys.paymentMethods),
            ),
            _buildDivider(context),
            _buildAccountMenuItem(
              context,
              icon: AppImages.piFavoriteHeart,
              title: context.translate(LangKeys.favorites),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountMenuItem(
    BuildContext context, {
    required String icon,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 22.h,
            colorFilter: ColorFilter.mode(
              context.color.textColor!,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextApp(
              text: title,
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ),
          SvgPicture.asset(
            Directionality.of(context) == TextDirection.rtl
                ? AppImages.piChevronLeft
                : AppImages.piChevronRight,
            height: 14.h,
            colorFilter: ColorFilter.mode(
              context.color.textColor!.withOpacity(0.6),
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppFeaturesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          context,
          icon: AppImages.piSettings,
          title: context.translate(LangKeys.applicationFeatures),
        ),
        _buildSectionCard(
          context,
          children: [
            const LanguageChange(),
            _buildDivider(context),
            const DarkModeChange(),
            _buildDivider(context),
            const NotificationsChange(),
            _buildDivider(context),
            const BuildDeveloper(),
            _buildDivider(context),
            const BuildVersion(),
            _buildDivider(context),
            const LogOutWidget(),
          ],
        ),
      ],
    );
  }
}
