import 'dart:async';

import 'package:demo/constants/asset/images.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/router/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  goToLoginView() async {
    await Future.delayed(const Duration(seconds: 2)).then((_) {
      Routes.goLogin();
    });
  }

  goToHomeView() async {
    await Future.delayed(const Duration(seconds: 2)).then((_) {
      Routes.goHome();
    });
  }

  goToRegisterView() async {
    await Future.delayed(const Duration(seconds: 2)).then((_) {
      Routes.goHome();
    });
  }

  goToAdminView() async {
    await Future.delayed(const Duration(seconds: 2)).then((_) {
      Routes.goAdmin();
    });
  }

  getRememberLogin() {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    String? role = determineUserRole(firebaseUser);
    if (firebaseUser != null && role != null) {
      (role == 'admin') ? goToHomeView() : goToHomeView();
    } else {
      goToLoginView();
    }
  }

  String? determineUserRole(User? user) {
    if (user != null) {
      if (user.email != null && user.email!.contains('admin')) {
        return 'admin';
      } else {
        return 'user';
      }
    }
    return null;
  }

  @override
  void initState() {
    getRememberLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.greenColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetImages.imageMotor),
          const Text(
            'Demo',
            style: MyTextStyle.headerWhiteBold22,
          ),
        ],
      ),
    );
  }
}
