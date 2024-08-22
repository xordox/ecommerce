import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/authentication/pages/enter_password.dart';
import 'package:ecommerce/presentation/authentication/pages/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: BasicAppbar(hideBack: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          children: [
            _signinText(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _continueButton(context),
            _createAccount(context)
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context){
    return const Text("Sign In",
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

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(onPressed: (){
      AppNavigator.push(context, const EnterPasswordPage());
    }, title: "Continue",);
  }

  Widget _createAccount(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        const TextSpan(
          text: "Don't you have an account?"
        ),
        TextSpan(
          text: "Create One",
          recognizer: TapGestureRecognizer()..onTap =(){
            AppNavigator.push(context, SignUpPage());
          },
          style: const TextStyle(fontWeight: FontWeight.bold)
        )
      ]
    ));
  }
}