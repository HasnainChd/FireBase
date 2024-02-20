import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_week6/Screens/dashboard_screen.dart';
import 'package:firebase_week6/Screens/login_screen.dart';
import 'package:firebase_week6/Screens/uihelper_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  signUp(String email, String password) async {
    if (email == '' && password == '') {
      return UiHelper.customAlertBox('Enter required fields');
    } else {
      UserCredential? userCredential;
      try {
        userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password);
        Fluttertoast.showToast(msg: 'User registered successfully');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) =>const  DashBoardScreen()
              ));
      } on FirebaseAuthException catch (ex) {
        return UiHelper.customAlertBox(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('SignUp-Page'),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customTextField(
                emailController, Icons.mail, 'email', false),
            const Gap(10),
            UiHelper.customTextField(
                passController, Icons.lock, 'password', true),
            const Gap(10),

            SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    signUp(emailController.text.toString(),
                        passController.text.toString());
                  }, child: const Text('SignUp')),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have account?'),
                TextButton(onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                }, child: const Text('SignIn'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
