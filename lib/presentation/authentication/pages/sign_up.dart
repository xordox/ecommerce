import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/authentication/pages/enter_password.dart';
import 'package:ecommerce/presentation/authentication/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
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
            _createAccount(context)
          ],
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
    return const TextField(
      decoration: InputDecoration(
        hintText: "Enter email"
      ),
    );
  }
  Widget _firstNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Enter first name"
      ),
    );
  }
  Widget _lastNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Enter last name"
      ),
    );
  }
  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Enter password"
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(onPressed: (){
      AppNavigator.push(context, const EnterPasswordPage());
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
            AppNavigator.pushReplacement(context, SignInPage());
          },
          style: const TextStyle(fontWeight: FontWeight.bold)
        )
      ]
    ));
  }
}