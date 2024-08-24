import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/category/entity/category.dart';
import 'package:ecommerce/domain/category/usecases/get_categories.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:meta/meta.dart';

part 'category_display_state.dart';

class CategoryDisplayCubit extends Cubit<CategoryDisplayState> {
  CategoryDisplayCubit() : super(CategoryLoading());

  void displayCategories() async {
    var res = await sl<GetCategoriesUseCase>().call();

    res.fold((error) => emit(CategoryFailed()), (data) => emit(CategoryLoaded(categories: data)));
  }
}
