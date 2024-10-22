import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Pages/LoginOrRegister.dart';
import 'package:my_app/Widgets/MyBottomNB.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Something went wrong!"));
          } else if (snapshot.hasData) {
            return MyBottomNavigationBar();
          } else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
