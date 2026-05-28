import 'package:asroo_store/core/common/widgets/customer_app_bar.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/features/customer/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:asroo_store/features/customer/checkout/presentation/refactors/shipping_address_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<CheckoutCubit>(),
      child: Scaffold(
        backgroundColor: context.color.mainColor,
        appBar: const CustomAppBar(title: 'Shipping Address'),
        body: const ShippingAddressBody(),
      ),
    );
  }
}
