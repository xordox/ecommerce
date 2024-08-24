import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/auth/entity/user.dart';
import 'package:ecommerce/domain/auth/usecases/get_user.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:meta/meta.dart';

part 'user_info_display_state.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUseCase>().call();

    returnedData.fold((error) => emit(UserInfoFailure()),
        (data) => emit(UserInfoLoaded(user: data)));
  }
}
