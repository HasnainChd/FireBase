import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_week6/Screens/dashboard_screen.dart';
import 'package:firebase_week6/Screens/login_screen.dart';
import 'package:flutter/material.dart';

class UserCheckScreen extends StatefulWidget {
  const UserCheckScreen({super.key});

  @override
  State<UserCheckScreen> createState() => _UserCheckScreenState();
}

class _UserCheckScreenState extends State<UserCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return  checkUser();
  }
}

checkUser(){
  final user= FirebaseAuth.instance.currentUser;
  if(user!= null){
    return const  DashBoardScreen();
  }else{
    return const LoginScreen();
  }
}


