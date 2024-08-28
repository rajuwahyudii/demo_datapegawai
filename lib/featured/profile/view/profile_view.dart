import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/profile/widget/data_profile.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        elevation: 0,
        leading: ArrowBackWidget(
          color: MyColor.mainColor,
        ),
        title: const Text(
          'Profile',
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: Container(
        color: MyColor.mainColor,
        width: getWidth(context),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                  DataProfileWidget(
                    data: data.first['nama'],
                    label: 'Nama',
                  ),
                  DataProfileWidget(
                    data: data.first['email'],
                    label: 'Email',
                  ),
                  DataProfileWidget(
                    data: data.first['nik'],
                    label: 'No Identitas',
                  ),
                  DataProfileWidget(
                    data: data.first['motor'],
                    label: 'Merek Motor',
                  ),
                  DataProfileWidget(
                    data: data.first['alamat'],
                    maxLines: 3,
                    label: 'Alamat',
                  ),
                ],
              );
            }),
      ),
    );
  }
}
