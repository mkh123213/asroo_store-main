import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/qraphql_queries/admin/products_queries.dart';
import 'package:asroo_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_reponse.dart';
import 'package:asroo_store/features/admin/add_products/data/models/update_product_request_body.dart';
import 'package:dio/dio.dart';

class ProductsAdminDataSource {
  const ProductsAdminDataSource(this._graphql, this._dio);

  final ApiService _graphql;
  final Dio _dio;

  // Get All products admin
  Future<GetAllProductResponse> getAllProductsAdmin() async {
    final response = await _graphql
        .getAllProduct(ProductsQueries().getAllProductsMapQuery());
    return response;
  }

  // Create products admin
  Future<int> createProductsAdmin({
    required CreateProductRequestBody body,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '$baseUrl$graphql',
      data: ProductsQueries().createProductMap(body: body),
    );
    final productId =
        response.data?['data']?['addProduct']?['id'] as String? ?? '0';
    return int.parse(productId);
  }

  // delete products
  Future<void> deleteProducts({
    required String productId,
  }) async {
    final response = await _graphql
        .deleteProduct(ProductsQueries().deleteMapQuery(productId: productId));
    return response;
  }

  // Update products admin
  Future<void> updateProductsAdmin({
    required UpdateProductRequestBody body,
  }) async {
    final response = await _graphql
        .updateProduct(ProductsQueries().updateProductMap(body: body));
    return response;
  }
}
