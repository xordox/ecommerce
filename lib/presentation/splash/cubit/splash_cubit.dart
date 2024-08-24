import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/auth/usecases/is_logged_in.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    bool isLoggedIn = await sl<IsLoggedInUseCase>().call();

    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
