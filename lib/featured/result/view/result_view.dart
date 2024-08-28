import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/asset/images.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  ResultView({
    super.key,
    required this.kode,
  });

  String kode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        elevation: 0,
        leading: ArrowBackWidget(color: MyColor.mainColor),
        title: const Text(
          'Diagnosa',
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: SizedBox(
        width: getWidth(context),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              AssetImages.imageService,
              width: getWidth(context) * 0.5,
            ),
            const SizedBox(height: 20),
            if (kode != 'Diagnosis inconclusive.')
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('kerusakan')
                      .where('kode', isEqualTo: kode)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final data = snapshot.data!.docs;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Kerusakan motor kamu $kode',
                            style: MyTextStyle.headerBlackBold18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            data.first['kerusakan'] ?? kode,
                            style: MyTextStyle.headerGreenBold14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Solusi : ${data.first['solusi']}",
                            style: MyTextStyle.bodyBlack14,
                          ),
                        ),
                      ],
                    );
                  }),
            if (kode == 'Diagnosis inconclusive.')
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Maaf kerusanan Motor kamu "$kode"',
                  style: MyTextStyle.headerBlackBold18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
