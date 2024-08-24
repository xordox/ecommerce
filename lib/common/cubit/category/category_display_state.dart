part of 'category_display_cubit.dart';

@immutable
sealed class CategoryDisplayState {}

final class CategoryLoading extends CategoryDisplayState {}

final class CategoryLoaded extends CategoryDisplayState {
  final List<CategoryEntity> categories;

  CategoryLoaded({required this.categories});
}

final class CategoryFailed extends CategoryDisplayState {}
