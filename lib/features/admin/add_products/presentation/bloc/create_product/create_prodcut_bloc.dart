import 'dart:async';
import 'package:asroo_store/features/admin/add_notifications/data/data_source/add_notificaion_data_source.dart';
import 'package:asroo_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:asroo_store/features/admin/add_products/data/repos/products_admin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_prodcut_event.dart';
part 'create_prodcut_state.dart';
part 'create_prodcut_bloc.freezed.dart';

class CreateProdcutBloc extends Bloc<CreateProdcutEvent, CreateProdcutState> {
  CreateProdcutBloc(this._repo, this._notificationDataSource)
      : super(const _Initial()) {
    on<NewCreateProductEvent>(_createproduct);
  }

  final ProductsAdminRepo _repo;
  final AddNotificationDataSource _notificationDataSource;

  FutureOr<void> _createproduct(
    NewCreateProductEvent event,
    Emitter<CreateProdcutState> emit,
  ) async {
    emit(const CreateProdcutState.loading());

    final result = await _repo.createProductsAdmin(body: event.body);

    await result.when(
      success: (productId) async {
        await _notificationDataSource.sendNotifications(
          title: 'New Product Added!',
          body: 'Check out "${event.body.title}" now available in our store.',
          productId: productId,
        );
        await _notificationDataSource.addNotificationsToAllUsersFirebase(
          title: 'New Product Added!',
          body: 'Check out "${event.body.title}" now available in our store.',
          productId: productId,
        );
        emit(const CreateProdcutState.success());
      },
      failure: (error) {
        emit(CreateProdcutState.error(error: error));
      },
    );
  }
}
