import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:petquest/auth/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              // Add your logout logic here
              await FirebaseAuth.instance.signOut();
              // Optionally, navigate to the login screen after logout
              Get.to(() => Login());
            },
          ),
        ],
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}