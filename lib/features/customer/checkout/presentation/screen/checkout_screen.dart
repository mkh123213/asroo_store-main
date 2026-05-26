import 'package:asroo_store/core/common/widgets/customer_app_bar.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/features/customer/cart/presentation/cubit/cart_cubit.dart';
import 'package:asroo_store/features/customer/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:asroo_store/features/customer/checkout/presentation/refactors/checkout_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<CheckoutCubit>()),
        BlocProvider(create: (context) => sl<CartCubit>()),
      ],
      child: Scaffold(
        backgroundColor: context.color.mainColor,
        appBar: const CustomAppBar(title: 'Checkout'),
        body: const CheckoutBody(),
      ),
    );
  }
}
