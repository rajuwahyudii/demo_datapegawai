import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/admin/model/model_aturan.dart';
import 'package:demo/featured/admin/state/admin_provider.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:flutter/material.dart';

class DetailAturan extends StatelessWidget {
  DetailAturan({required this.modelAturan, super.key});
  ModelAturan modelAturan;

  @override
  Widget build(BuildContext context) {
    final List<String> listGejala = AdminProvider.watch(context).listGejala;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        elevation: 0,
        leading: ArrowBackWidget(
          color: MyColor.mainColor,
        ),
        title: const Text(
          'Detail Aturan',
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: Container(
        width: getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                modelAturan.kerusakan!,
                style: MyTextStyle.headerGreenBold14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                shrinkWrap: true,
                itemCount: listGejala.length, // Replace with your data source
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: MyColor.grayColor,
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        listGejala[index],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
