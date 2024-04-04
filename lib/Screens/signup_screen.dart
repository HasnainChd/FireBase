import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_week6/Screens/login_screen.dart';
import 'package:firebase_week6/Screens/uihelper_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  signUp(String email, String password) async {
    if (email == '' || password == '') {
      return UiHelper.customAlertbox('Enter Required Fields');
    } else {
      UserCredential? userCredential;
      try {
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // If user creation is successful, show success message
        UiHelper.customAlertbox('User account created!');
      } on FirebaseAuthException catch (ex) {
        // If there's an error during user creation, show the error
        return UiHelper.customAlertbox(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: const [
            Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 50,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customTextField(
                    emailController, 'Enter your email', false, Icons.mail),
                const Gap(10),
                UiHelper.customTextField(
                    passwordController, 'Enter password', true, Icons.lock),
                const Gap(10),
                UiHelper.customTextField(
                    cPasswordController, 'Confirm password', true, Icons.lock),
                const Gap(10),
                ElevatedButton(
                    onPressed: () {
                      if (passwordController.text != cPasswordController.text) {
                        UiHelper.customAlertbox('password do not match');
                      } else {
                        signUp(emailController.text.toString(),
                            passwordController.text.toString());
                      }
                    },
                    child: const Text('Signup')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                      },
                      child: const Text('Sign In'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
