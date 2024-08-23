import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/data/auth/models/user_creation_req.dart';
import 'package:ecommerce/presentation/authentication/pages/enter_password.dart';
import 'package:ecommerce/presentation/authentication/pages/gender_and_age_selection.dart';
import 'package:ecommerce/presentation/authentication/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              _signUpText(context),
              const SizedBox(height: 20,),
              _emailField(context),
              const SizedBox(height: 20,),
              _firstNameField(context),
              const SizedBox(height: 20,),
              _lastNameField(context),
              const SizedBox(height: 20,),
              _passwordField(context),
              const SizedBox(height: 20,),
              _continueButton(context),
              const SizedBox(height: 20,),
              _createAccount(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpText(BuildContext context){
    return const Text("Create Account",
    style: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold
    ),);
  }

  Widget _emailField(BuildContext context) {
    return  TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: "Enter email"
      ),
    );
  }
  Widget _firstNameField(BuildContext context) {
    return  TextField(
      controller: _firstNameCon,
      decoration: const InputDecoration(
        hintText: "Enter first name"
      ),
    );
  }
  Widget _lastNameField(BuildContext context) {
    return  TextField(
      controller: _lastNameCon,
      decoration: const InputDecoration(
        hintText: "Enter last name"
      ),
    );
  }
  Widget _passwordField(BuildContext context) {
    return  TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: "Enter password"
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(onPressed: (){
      AppNavigator.push(context,  GenderAndAgeSelectionPage(userCreationReq: UserCreationReq(
       firstName: _firstNameCon.text,
              email: _emailCon.text, 
              lastName: _lastNameCon.text,
              password: _passwordCon.text
           ),),);
    }, title: "Continue",);
  }

  Widget _createAccount(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        const TextSpan(
          text: "Do you have an account?"
        ),
        TextSpan(
          text: "SignIn",
          recognizer: TapGestureRecognizer()..onTap =(){
            AppNavigator.pushReplacement(context,  SignInPage());
          },
          style: const TextStyle(fontWeight: FontWeight.bold)
        )
      ]
    ));
  }
}