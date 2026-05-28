import 'package:asroo_store/core/common/widgets/customer_app_bar.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/extensions/string_exetension.dart';
import 'package:asroo_store/features/customer/cart/presentation/cubit/cart_cubit.dart';
import 'package:asroo_store/features/customer/product_details/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:asroo_store/features/customer/product_details/presentation/refactors/add_to_cart_button.dart';
import 'package:asroo_store/features/customer/product_details/presentation/refactors/product_deatils_custom_painter.dart';
import 'package:asroo_store/features/customer/product_details/presentation/refactors/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({required this.productId, super.key});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductDetailsBloc>()
            ..add(
              ProductDetailsEvent.productDetails(productId: productId),
            ),
        ),
        BlocProvider(create: (context) => sl<CartCubit>()),
      ],
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: context.color.textColor,
                  ),
                ),
              );
            },
            success: (productModel) {
              return Scaffold(
                appBar: CustomAppBar(
                  title: productModel.title!.convertLongString(),
                ),
                bottomNavigationBar: AddToCartButton(
                  price: productModel.price ?? 0.0,
                  productId: int.tryParse(productModel.id ?? '0') ?? 0,
                  title: productModel.title ?? '',
                  image: productModel.images.isNotEmpty
                      ? productModel.images.first.imageProductFormate()
                      : '',
                  categoryName: productModel.category?.name ?? '',
                ),
                body: Stack(
                  children: [
                    CustomPaint(
                      size: Size(
                        MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height,
                      ),
                      painter: DetailsCustomPainter(
                        gradient: LinearGradient(
                          colors: [
                            context.color.bluePinkLight!,
                            context.color.bluePinkDark!,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    ProductDetailsBody(
                      productModel: productModel,
                    ),
                  ],
                ),
              );
            },
            error: (error) {
              return Scaffold(
                body: Center(
                  child: Text(error),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
