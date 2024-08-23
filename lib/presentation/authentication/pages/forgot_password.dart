import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/authentication/pages/enter_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BasicAppbar(hideBack: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          children: [
            _forgotPasswordText(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _continueButton(context),
          ],
        ),
      ),
    );
  }

  Widget _forgotPasswordText(BuildContext context){
    return const Text("Forgot Password",
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
      //AppNavigator.push(context,  EnterPasswordPage());
    }, title: "Continue",);
  }

  }