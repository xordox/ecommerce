import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:ecommerce/data/auth/models/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> getAges();
  Future<Either>sendPasswordResetEmail(String email);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signup(UserCreationReq user) async{
    try{
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password);

    await FirebaseFirestore.instance.collection('Users').doc(
      data.user!.uid
    ).set({
      "firstName": user.firstName,
      "lastName": user.lastName,
      "email": user.email,
      "gender": user.gender,
      "age": user.age
    });

    return const Right("User created successfully");

    } on FirebaseAuthException catch(e) {
      String message = '';
      if(e.code == 'weak-password') {
        message = "Too weak password";
      }else if (e.code == 'email-already-in-use'){
        message ="Email already in use";
      }
      else{message = "something went worng";}
      return Left(message);
    }
  }
  
  @override
  Future<Either> getAges() async{
   try{
      var data = await FirebaseFirestore.instance.collection("Ages").get();

      return Right(data.docs);

   }catch (e) {
    return const Left("Please try again");
   }
  
}

  @override
  Future<Either> signin(UserSigninReq user)async{
    try{
      var data = await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password!);

    return const Right("Sign in successfully");

    } on FirebaseAuthException catch(e) {
      String message = '';
      if(e.code == 'invalid-email') {
        message = "Invalid email";
      }else if (e.code == 'wrong-password'){
        message ="Wrong password";
      }else if (e.code == 'invalid-credential'){
        message ="Invalid credentials";
      }
      else{message = "something went worng";}
      return Left(message);
    }}
    
      @override
      Future<Either> sendPasswordResetEmail(String email) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right("Password reset email is sent");
    }catch(e){
      return const Left("Error while sending password reset email");
    }
      }
}