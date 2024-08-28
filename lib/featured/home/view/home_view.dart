import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/asset/images.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/decoration.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/home/view_model/home_view_model.dart';
import 'package:demo/featured/home/widget/home_floating_button.dart';
import 'package:demo/packages/get_it.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.mainColor,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: MyColor.greenColor,
        elevation: 0,
        title: const Text(
          'Home',
          style: MyTextStyle.headerWhiteBold18,
        ),
        actions: [
          IconButton(
            onPressed: () {
              doubleAlert(context,
                  title: 'Apakah kamu ingin keluar ?',
                  titleButtonLeft: 'Batal',
                  titleButtonRight: 'Keluar', onPressedLeft: () {
                Navigator.of(context).pop();
              }, onPressedRight: () {
                Navigator.of(context).pop();
                getIt<HomeViewModel>().doSignOut(context);
              });
            },
            icon: const Icon(
              Icons.logout,
              color: MyColor.mainColor,
            ),
          )
        ],
      ),
      body: Container(
          width: getWidth(context),
          color: MyColor.greenColor,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Selamat Datang di Sistem Pendataan Pegawai',
                  style: MyTextStyle.subHeaderWhiteSemibold18,
                ),
              ),
              SizedBox(height: getHeight(context) * 0.1),
            ],
          )),
      floatingActionButton: Container(
        decoration: MyDecoration.lrboxRad14hite,
        width: getWidth(context),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              }
              final data = snapshot.data!.docs;
              return data.first['role'] == 'admin'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeFloatingButton(
                          function: () {
                            Routes.goAdmin();
                          },
                          icon: Icons.person,
                          title: 'Admin',
                        ),
                        HomeFloatingButton(
                          function: () {
                            Routes.goProfile();
                          },
                          icon: Icons.person,
                          title: 'Profil',
                        )
                      ],
                    )
                  : HomeFloatingButton(
                      function: () {
                        Routes.goProfile();
                      },
                      icon: Icons.person,
                      title: 'Profil',
                    );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
