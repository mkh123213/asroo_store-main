import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/features/customer/orders/presentation/cubit/order_tracking_cubit.dart';
import 'package:asroo_store/features/customer/orders/presentation/refactors/order_tracking_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({required this.orderId, super.key});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<OrderTrackingCubit>()..loadOrder(orderId),
      child: Scaffold(
        backgroundColor: context.color.mainColor,
        body: const SafeArea(child: OrderTrackingBody()),
      ),
    );
  }
}
