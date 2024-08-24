import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/domain/product/entity/product.dart';
import 'package:ecommerce/domain/product/usecases/get_top_selling.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:meta/meta.dart';

part 'products_display_state.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  ProductsDisplayCubit({required this.useCase}) : super(ProductsLoading());
  final UseCase useCase;

  void displayProducts() async{

    var returnedData = await useCase.call();

    return returnedData.fold((l) => emit(ProductsFailure()), (r) => emit(ProductsLoaded(products: r)));
  }
}
