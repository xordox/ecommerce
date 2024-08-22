import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/authentication/pages/forgot_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BasicAppbar(),
      body: Column(
        children: [
          _signinText(context),
          const SizedBox(height: 20,),
          _passwordField(context),
          const SizedBox(height: 20,),
          _continueButton(),
          _forgotPassword(context)
        ],
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

  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Enter password"
      ),
    );
  }

  Widget _continueButton() {
    return BasicAppButton(onPressed: (){}, title: "Continue",);
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        const TextSpan(
          text: "Forgot password?"
        ),
        TextSpan(
          text: "Reset",
          recognizer: TapGestureRecognizer()..onTap =(){
            AppNavigator.push(context, const ForgotPasswordPage());
          },
          style: const TextStyle(fontWeight: FontWeight.bold)
        )
      ]
    ));
  }
}