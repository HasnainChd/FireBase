import 'package:firebase_week6/Screens/signup_screen.dart';
import 'package:firebase_week6/Screens/uihelper_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: Padding(padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customTextField(emailController, 'Enter email', false, Icons.mail),
            const Gap(10),
            UiHelper.customTextField(passwordController, 'Enter password', true, Icons.lock),
            const Gap(10),
            ElevatedButton(onPressed: (){

            }, child: const Text('login')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('Don\'t have an account?'),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpPage()));
              }, child: const Text('Signup'))
            ],)
          ],
      ),),
    );
  }
}
