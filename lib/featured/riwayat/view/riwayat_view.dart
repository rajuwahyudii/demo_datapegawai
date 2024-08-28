import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:demo/shared/widget/empty_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RiwayatView extends StatelessWidget {
  const RiwayatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        elevation: 0,
        leading: ArrowBackWidget(color: MyColor.mainColor),
        title: const Text(
          'Riwayat Diagnosa',
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: SizedBox(
        width: getWidth(context),
        child: StreamBuilder(
          // stream: FirebaseFirestore.instance
          //     .collection('user')
          //     .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          //     .snapshots()
          //     .switchMap((userSnapshot) {
          //   final userDoc = userSnapshot.docs.first;
          //   final userId = userDoc.id;

          //   return FirebaseFirestore.instance
          //       .collection('user')
          //       .doc(userId)
          //       .collection('history')
          //       .snapshots();
          // }),

          stream: FirebaseFirestore.instance
              .collection('history')
              .where('user_id',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Routes.goDetailDiagnosa(data[index]['kerusakan']);
                  },
                  title: Text(data[index]['kerusakan']),
                  subtitle: Text(data[index]['created_at'].toString()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
