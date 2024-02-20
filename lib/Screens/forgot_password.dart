import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_week6/Screens/uihelper_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  TextEditingController emailController = TextEditingController();

  resetPassword(String email) async {
    if (email == '') {
      UiHelper.customAlertBox('Enter an email to reset your password');
    } else {
      try {
        UserCredential userCredential;
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        UiHelper.customAlertBox('An email is send to your email address');
      } on FirebaseAuthException catch (ex) {
        UiHelper.customAlertBox(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customTextField(
                emailController, Icons.mail, 'Email', false),
            Gap(10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white),
                onPressed: () {
                  resetPassword(emailController.text.toString());
                },
                child: const Text('Reset Password')),
          ],
        ),
      ),
    );
  }
}
