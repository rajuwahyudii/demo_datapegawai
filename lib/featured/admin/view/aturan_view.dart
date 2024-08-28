import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/admin/model/model_aturan.dart';
import 'package:demo/featured/admin/state/admin_provider.dart';
import 'package:demo/featured/admin/view_model/admin_view_model.dart';
import 'package:demo/packages/get_it.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/alert.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:demo/shared/widget/empty_page.dart';
import 'package:flutter/material.dart';

class AturanView extends StatelessWidget {
  const AturanView({super.key});

  @override
  Widget build(BuildContext context) {
    ModelAturan modelAturan = ModelAturan();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        leading: ArrowBackWidget(
          color: MyColor.mainColor,
        ),
        title: const Text(
          'Aturan',
          style: MyTextStyle.headerWhiteBold18,
        ),
        actions: [
          IconButton(
            onPressed: () {
              AdminProvider.read(context).clear();
              modelAturan.isEdit = false;

              Routes.goAdminAddAturan(modelAturan);
            },
            icon: const Icon(
              Icons.add,
              color: MyColor.mainColor,
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: getWidth(context),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('aturan').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: SizedBox(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return const EmptyPage();
            }

            final data = snapshot.data!.docs;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final document = data[index];

                final subcollectionRef =
                    document.reference.collection('gejala');
                return FutureBuilder<QuerySnapshot>(
                    future: subcollectionRef.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return ListTile(
                        title: Text(
                          'Kerusakan: ${data[index]['kerusakan']}',
                          style: MyTextStyle.subHeaderSemibold14,
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                AdminProvider.read(context).setKerusakan('');
                                AdminProvider.read(context).setListGejala([]);
                                AdminProvider.read(context).setId('');

                                modelAturan.isEdit = true;
                                modelAturan.kerusakan =
                                    data[index]['kerusakan'];
                                getIt<AdminViewModel>().doSetGejalaEdit(
                                    context, data[index]['id']);
                                AdminProvider.read(context)
                                    .setKerusakan(data[index]['kerusakan']);
                                AdminProvider.read(context)
                                    .setId(data[index]['id']);
                                Routes.goDetailAdminAturan(modelAturan);
                              },
                              icon: const Icon(
                                Icons.details,
                                color: MyColor.greenColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                doubleAlert(context,
                                    title:
                                        'Hapus Aturan Kerusakan ${data[index]['kerusakan']} ?',
                                    titleButtonLeft: 'Batal',
                                    titleButtonRight: 'Hapus',
                                    onPressedLeft: () {
                                  Navigator.of(context).pop();
                                }, onPressedRight: () {
                                  Navigator.of(context).pop();
                                  getIt<AdminViewModel>().doDeleteAturan(
                                      context, data[index]['id']);
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: MyColor.redColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
            );
          },
        ),
      ),
    );
  }
}
