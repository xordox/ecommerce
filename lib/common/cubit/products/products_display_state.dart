part of 'products_display_cubit.dart';

@immutable
sealed class ProductsDisplayState {}

final class ProductsLoading extends ProductsDisplayState {}
final class ProductsLoaded extends  ProductsDisplayState {
  final List<ProductEntity> products;

  ProductsLoaded({required this.products});
}
final class ProductsFailure extends ProductsDisplayState {}
