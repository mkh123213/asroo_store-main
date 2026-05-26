import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShippingAddressBody extends StatefulWidget {
  const ShippingAddressBody({super.key});

  @override
  State<ShippingAddressBody> createState() => _ShippingAddressBodyState();
}

class _ShippingAddressBodyState extends State<ShippingAddressBody> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _streetController;
  late final TextEditingController _buildingController;
  late final TextEditingController _floorController;
  late final TextEditingController _notesController;

  String _selectedCity = 'Cairo';
  String _selectedArea = 'Nasr City';

  final _cities = ['Cairo', 'Alexandria', 'Giza', 'Dubai', 'Sharjah'];
  final _areas = [
    'Nasr City',
    'Maadi',
    'Heliopolis',
    'Downtown',
    'Zamalek',
  ];

  @override
  void initState() {
    super.initState();
    final address = context.read<CheckoutCubit>().savedAddress;
    _nameController = TextEditingController(text: address?.fullName ?? '');
    _phoneController = TextEditingController(text: address?.phoneNumber ?? '');
    _streetController = TextEditingController(text: address?.street ?? '');
    _buildingController =
        TextEditingController(text: address?.buildingNo ?? '');
    _floorController = TextEditingController(text: address?.floor ?? '');
    _notesController =
        TextEditingController(text: address?.addressNotes ?? '');
    if (address != null) {
      _selectedCity = address.city;
      _selectedArea = address.area;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _buildingController.dispose();
    _floorController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildField(
                    label: 'Full Name',
                    icon: AppImages.icUser,
                    controller: _nameController,
                  ),
                  SizedBox(height: 14.h),
                  _buildField(
                    label: 'Phone Number',
                    icon: AppImages.icPhone,
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 14.h),
                  _buildDropdown(
                    label: 'City',
                    icon: AppImages.icCity,
                    value: _selectedCity,
                    items: _cities,
                    onChanged: (v) => setState(() => _selectedCity = v!),
                  ),
                  SizedBox(height: 14.h),
                  _buildDropdown(
                    label: 'Area',
                    icon: AppImages.icBuilding,
                    value: _selectedArea,
                    items: _areas,
                    onChanged: (v) => setState(() => _selectedArea = v!),
                  ),
                  SizedBox(height: 14.h),
                  _buildField(
                    label: 'Street',
                    icon: AppImages.icStreet,
                    controller: _streetController,
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildField(
                          label: 'Building No.',
                          icon: AppImages.icBuilding,
                          controller: _buildingController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildField(
                          label: 'Floor / Apt',
                          icon: AppImages.icFloor,
                          controller: _floorController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  _buildField(
                    label: 'Address Notes',
                    icon: AppImages.icMessageNote,
                    controller: _notesController,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
        // Save button
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
          child: GestureDetector(
            onTap: _saveAddress,
            child: Container(
              height: 52.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
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
                    AppImages.icSave,
                    height: 20.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  TextApp(
                    text: 'Save Address',
                    theme: context.textStyle.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(
                    AppImages.icChevronRight,
                    height: 16.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _saveAddress() async {
    if (_formKey.currentState!.validate()) {
      await context.read<CheckoutCubit>().saveAddress(
            fullName: _nameController.text,
            phoneNumber: _phoneController.text,
            city: _selectedCity,
            area: _selectedArea,
            street: _streetController.text,
            buildingNo: _buildingController.text,
            floor: _floorController.text,
            addressNotes: _notesController.text,
          );
      if (mounted) context.pop();
    }
  }

  Widget _buildField({
    required String label,
    required String icon,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        gradient: LinearGradient(
          colors: [
            context.color.containerLinear1!.withOpacity(0.8),
            context.color.containerLinear2!.withOpacity(0.8),
          ],
          begin: const Alignment(0.36, 0.27),
          end: const Alignment(0.58, 0.85),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 18.h,
            colorFilter: ColorFilter.mode(
              context.color.bluePinkLight!,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              style: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.medium,
                color: context.color.textColor,
              ),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: context.textStyle.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeightHelper.regular,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '$label is required';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String icon,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        gradient: LinearGradient(
          colors: [
            context.color.containerLinear1!.withOpacity(0.8),
            context.color.containerLinear2!.withOpacity(0.8),
          ],
          begin: const Alignment(0.36, 0.27),
          end: const Alignment(0.58, 0.85),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 18.h,
            colorFilter: ColorFilter.mode(
              context.color.bluePinkLight!,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                TextApp(
                  text: label,
                  theme: context.textStyle.copyWith(
                    fontSize: 11.sp,
                    fontWeight: FontWeightHelper.regular,
                    color: Colors.grey,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    isExpanded: true,
                    isDense: true,
                    dropdownColor: context.color.mainColor,
                    style: context.textStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeightHelper.medium,
                      color: context.color.textColor,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: context.color.textColor,
                      size: 20.sp,
                    ),
                    items: items
                        .map(
                          (e) => DropdownMenuItem(value: e, child: Text(e)),
                        )
                        .toList(),
                    onChanged: onChanged,
                  ),
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
