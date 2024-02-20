import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_week6/Screens/login_screen.dart';
import 'package:firebase_week6/Screens/uihelper_screen.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  logOut()async{
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Center(child: Text('Dashboard'),),
      actions: [
        IconButton(onPressed: (){
          logOut();
          UiHelper.customAlertBox('Logout Successfully');
          Navigator.pushReplacement((context), MaterialPageRoute(builder: (context)=>const LoginScreen()));
        }, icon: const Icon(Icons.logout))
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('DashBoard'),)
        ],
      )
    );
  }
}
