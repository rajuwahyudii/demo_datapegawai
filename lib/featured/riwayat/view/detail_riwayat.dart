import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:demo/shared/widget/empty_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailRiwayatView extends StatelessWidget {
  const DetailRiwayatView({required this.kode, super.key});
  final String kode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        elevation: 0,
        leading: ArrowBackWidget(color: MyColor.mainColor),
        title: Text(
          kode,
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: SizedBox(
        width: getWidth(context),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('kerusakan')
              .where('kode', isEqualTo: kode)
              .limit(1)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return const EmptyPage();
            }
            final data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                data[0]['kerusakan'],
                style: MyTextStyle.headerBlackBold14,
              ),
            );
            // return ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: data.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(data[index]['kerusakan']),
            //       subtitle: Text(data[index]['created_at'].toString()),
            //     );
            //   },
            // );
          },
        ),
      ),
    );
  }
}
