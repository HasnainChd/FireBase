import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_week6/Screens/Forgot_password.dart';
import 'package:firebase_week6/Screens/home_screen.dart';
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

  logIn(String email, String password)async{
    if(email==  '' || password == ''){
      return UiHelper.customAlertbox('Enter required fields');
    }else{
      UserCredential? userCredential;
      try{
        userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        Navigator.of( context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomeScreen() ));
        UiHelper.customAlertbox('Login Successfully');
      }on FirebaseAuthException catch(ex){
        return UiHelper.customAlertbox(ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: Padding(padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customTextField(emailController, 'Enter email', false, Icons.mail),
            const Gap(10),
            UiHelper.customTextField(passwordController, 'Enter password', true, Icons.lock),
            const Gap(10),
            ElevatedButton(onPressed: (){
              logIn(emailController.text.trim(), passwordController.text.trim());
            }, child: const Text('login')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('Don\'t have an account?'),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignUpPage()));
              }, child: const Text('Signup'))
            ],),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ForgotPassword()));
            }, child: const Text('ForgotPassword?'))
          ],
      ),),
    );
  }
}
