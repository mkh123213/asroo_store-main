// Firebase Dynamic Links service was shut down in August 2025.
// This class is stubbed out to prevent compile errors.
class DynamicLink {
  factory DynamicLink() => _instance;
  DynamicLink._();
  static final DynamicLink _instance = DynamicLink._();

  Future<String> generateProductLink({
    required int productId,
    required String title,
    required String imageUrl,
  }) async => '';

  Future<void> initDynamicLink() async {}
}
