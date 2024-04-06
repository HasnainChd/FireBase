import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_week6/Screens/uihelper_screen.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  forgotPassword(String email){
    if(email == ''){
      UiHelper.customAlertbox('enter email to reset password');
    }else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      UiHelper.customAlertbox('A link is send to your email address click on that to reset password');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forgot Password',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            UiHelper.customTextField(
                emailController, 'enter email', false, Icons.mail),
            ElevatedButton(onPressed: (){
              forgotPassword(emailController.text.toString());
            }, child: const  Text('Forgot Password',)),
          ],),
        )
      ),
    );
  }
}
