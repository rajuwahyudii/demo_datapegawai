import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/home/view_model/home_view_model.dart';
import 'package:demo/featured/menu/widget/button_menu_widget.dart';
import 'package:demo/packages/get_it.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/alert.dart';
import 'package:flutter/material.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.mainColor,
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        title: const Text(
          'Admin',
          style: MyTextStyle.headerWhiteBold18,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Routes.goHome();
            },
            icon: const Icon(
              Icons.home_outlined,
              color: MyColor.mainColor,
            ),
          ),
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
      body: SizedBox(
        width: getWidth(context),
        child: Column(
          children: [
            ButtonMenuWidget(
              label: 'User',
              icon: Icons.person,
              onTap: () {
                Routes.goAdminUser();
              },
            ),
            ButtonMenuWidget(
              label: 'Kerusakan',
              icon: Icons.motorcycle,
              onTap: () {
                Routes.goAdminKerusakan();
              },
            ),
            ButtonMenuWidget(
              label: 'Gejala',
              icon: Icons.report,
              onTap: () {
                Routes.goAdminGejala();
              },
            ),
            ButtonMenuWidget(
              label: 'Aturan',
              icon: Icons.rule,
              onTap: () {
                Routes.goAdminAturan();
              },
            ),
          ],
        ),
      ),
    );
  }
}
