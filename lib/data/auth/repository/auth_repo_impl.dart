import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/models/user_signin_req.dart';
import 'package:ecommerce/data/source/auth_firebase_service.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signup(UserCreationReq user) async{
    return sl<AuthFirebaseService>().signup(user);
  }
  
  @override
  Future<Either> getAges() async{
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signin(UserSigninReq user) async{
    
    return await sl<AuthFirebaseService>().signin(user);
  }
  
  @override
  Future<Either> sendPasswordResetEmail(String email) async{
    return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

}