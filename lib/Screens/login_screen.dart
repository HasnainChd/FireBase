import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_week6/Screens/dashboard_screen.dart';
import 'package:firebase_week6/Screens/forgot_password.dart';
import 'package:firebase_week6/Screens/signup_screen.dart';
import 'package:firebase_week6/Screens/uihelper_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _errorText = '';
  final emailC = TextEditingController();
  final passC = TextEditingController();

  login(String email, String password) async {
    if (email == '' || password == '') {
      UiHelper.customAlertBox('Enter Required Fields');
    }
    try {
      UserCredential? userCredential;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password)
          .then((value) => {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const DashBoardScreen()))
      });
      UiHelper.customAlertBox('Login-Successfully');

    }
    on FirebaseAuthException catch(ex){
      UiHelper.customAlertBox(ex.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Login-page'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(height: 130,),
            TextField(
              controller: emailC,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )),
                errorText: _errorText.isEmpty ? null : _errorText,
              ),
              onChanged: (value) {
                setState(() {
                  if (!value.contains('@')) {
                    _errorText = 'not a valid email';
                  } else if (value.isEmpty || value.contains(' ')) {
                    _errorText = 'please don\'t use blanks';
                  } else {
                    _errorText = '';
                  }
                });
              },
            ),
            const Gap(10),
            TextField(
              controller: passC,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PasswordResetScreen()));
                }, child: const Text('Forgot Password??'))
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white),
                onPressed: () {
                  login(emailC.text.toString(), passC.text.toString());
                },
                child: const Text('Login')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not Registered yet?'),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return const SignUpScreen();
                          }));
                    },
                    child: const Text('SignUp')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
