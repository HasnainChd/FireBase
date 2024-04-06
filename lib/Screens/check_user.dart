import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_week6/Screens/home_screen.dart';
import 'package:firebase_week6/Screens/login_screen.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return  checkUser();
  }
}

checkUser(){
  final user= FirebaseAuth.instance.currentUser;
  if(user != null){
    return const HomeScreen();
  }else{
    return const LoginPage();
  }
}
