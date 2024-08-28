import 'package:demo/router/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);
    String? role = determineUserRole(firebaseUser);
    if (firebaseUser != null && role != null) {
      return (role == 'admin') ? Routes.goHome() : Routes.goHome();
    } else {
      return Routes.goLogin();
    }
  }

  String? determineUserRole(User? user) {
    if (user != null) {
      if (user.email != null && user.email!.toLowerCase().contains('admin')) {
        return 'admin';
      } else {
        return 'user';
      }
    }
    return null; // Return null if user is not logged in or role cannot be determined
  }
}
