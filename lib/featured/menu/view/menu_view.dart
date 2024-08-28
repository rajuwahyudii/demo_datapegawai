import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/diagnosa/state/diagnosa_provider.dart';
import 'package:demo/featured/menu/widget/button_menu_widget.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        elevation: 0,
        leading: ArrowBackWidget(color: MyColor.mainColor),
        title: const Text(
          'Menu',
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: SizedBox(
        width: getWidth(context),
        child: Column(
          children: [
            ButtonMenuWidget(
              label: 'Diagnosa',
              icon: Icons.analytics,
              onTap: () {
                DiagnosaProvider.read(context).clear();
                Routes.goDiagnosa();
              },
            ),
            ButtonMenuWidget(
              label: 'Riwayat Diagnosa',
              icon: Icons.report,
              onTap: () {
                Routes.goRiwayatDiagnosa();
              },
            ),
          ],
        ),
      ),
    );
  }
}
