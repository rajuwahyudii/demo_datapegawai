import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/profile/widget/data_profile.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:flutter/material.dart';

class AdminProfileView extends StatelessWidget {
  const AdminProfileView({required this.id, super.key});

  final String id;

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
          'Akun User',
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: Container(
        color: MyColor.mainColor,
        width: getWidth(context),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .where('id', isEqualTo: id)
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
                    data: data.first['tempat_lahir'] == ''
                        ? 'No Data'
                        : data.first['tempat_lahir'],
                    label: 'Tempat Lahir',
                  ),
                  DataProfileWidget(
                    data: data.first['jabatan'] == ''
                        ? 'No Data'
                        : data.first['jabatan'],
                    label: 'Jabatan',
                  ),
                ],
              );
            }),
      ),
    );
  }
}
