import 'package:ecommerce/data/auth/repository/auth_repo_impl.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/data/category/repository/category.dart';
import 'package:ecommerce/data/category/source/category_firebase_service.dart';
import 'package:ecommerce/data/product/repository/product.dart';
import 'package:ecommerce/data/product/source/product_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce/domain/auth/usecases/get_user.dart';
import 'package:ecommerce/domain/auth/usecases/is_logged_in.dart';
import 'package:ecommerce/domain/auth/usecases/send_password_reset_email.dart';
import 'package:ecommerce/domain/auth/usecases/sign_in.dart';
import 'package:ecommerce/domain/auth/usecases/sign_up.dart';
import 'package:ecommerce/domain/category/repository/category.dart';
import 'package:ecommerce/domain/category/usecases/get_categories.dart';
import 'package:ecommerce/domain/product/repository/product.dart';
import 'package:ecommerce/domain/product/usecases/get_new_in.dart';
import 'package:ecommerce/domain/product/usecases/get_top_selling.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());

  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());

  //repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());

  //usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());

  sl.registerSingleton<SendPasswordResetEmailUseCase>(SendPasswordResetEmailUseCase());

   sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

   sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

   sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase ());

   sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase ());
   
   sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase ());
}