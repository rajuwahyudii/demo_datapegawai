// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/admin/model/model_aturan.dart';
import 'package:demo/featured/admin/state/admin_provider.dart';
import 'package:demo/featured/admin/view_model/admin_view_model.dart';
import 'package:demo/packages/get_it.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/alert.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:demo/shared/widget/button_widget.dart';
import 'package:flutter/material.dart';

class AddAturanView extends StatelessWidget {
  AddAturanView({
    required this.modelAturan,
    super.key,
  });
  ModelAturan modelAturan;

  @override
  Widget build(BuildContext context) {
    final String aturanId = AdminProvider.watch(context).id;
    final List<String> listGejala = AdminProvider.watch(context).listGejala;
    final String kerusakan = AdminProvider.watch(context).kerusakan;

    // if (modelAturan.isEdit!) {
    //   // AdminProvider.read(context).setListGejala(modelAturan.gejala!);
    //   AdminProvider.read(context).setKerusakan(modelAturan.kerusakan!);
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        elevation: 0,
        leading: ArrowBackWidget(color: MyColor.mainColor),
        title: Text(
          modelAturan.isEdit! ? "Edit Aturan" : "Tambah Aturan",
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: SizedBox(
        width: getWidth(context),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              "Pilih Kerusakan",
              style: MyTextStyle.headerGreenBold14,
            ),
            const SizedBox(height: 16),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('kerusakan')
                    .orderBy('kode')
                    .snapshots(),
                builder: (streamcontext, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text(
                      "Tidak ada data Kerusakan",
                      style: MyTextStyle.headerGreenBold14,
                    );
                  }
                  final data = snapshot.data!.docs;
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              kerusakan == data[index]['kode']
                                  ? null
                                  : AdminProvider.read(context)
                                      .setKerusakan(data[index]['kode']);
                            },
                            title: Row(
                              children: [
                                kerusakan == data[index]['kode']
                                    ? const Icon(
                                        Icons.radio_button_checked_outlined,
                                        color: MyColor.greenColor,
                                      )
                                    : const Icon(
                                        Icons.radio_button_off_outlined,
                                        color: MyColor.grayColor,
                                      ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    '(${data[index]['kode']}) ${data[index]['kerusakan']}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: MyTextStyle.subHeaderSemibold14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }),
            const SizedBox(height: 16),
            const Text(
              "Pilih Gejala",
              style: MyTextStyle.headerGreenBold14,
            ),
            const SizedBox(height: 16),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('gejala')
                    .orderBy('kode')
                    .snapshots(),
                builder: (streamcontext, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text(
                      "Tidak ada data Gejala",
                      style: MyTextStyle.headerGreenBold14,
                    );
                  }
                  final data = snapshot.data!.docs;
                  return SizedBox(
                    height: getHeight(context) * 0.4,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              listGejala.contains(data[index]['kode'])
                                  ? AdminProvider.read(context)
                                      .removeGejala(data[index]['kode'])
                                  : AdminProvider.read(context)
                                      .addListGejala(data[index]['kode']);
                            },
                            title: Row(
                              children: [
                                listGejala.contains(data[index]['kode'])
                                    ? const Icon(
                                        Icons.check_box,
                                        color: MyColor.greenColor,
                                      )
                                    : const Icon(
                                        Icons.check_box_outline_blank_rounded,
                                        color: MyColor.grayColor,
                                      ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    '(${data[index]['kode']}) ${data[index]['gejala']}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: MyTextStyle.subHeaderSemibold14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }),
            SizedBox(height: getHeight(context) * 0.1 + 20),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: getHeight(context) * 0.1,
        width: getWidth(context),
        child: ButtonWidget(
          color: MyColor.greenColor,
          textColor: MyColor.mainColor,
          label: modelAturan.isEdit! ? "Ubah" : 'Simpan',
          function: () {
            if (kerusakan == '') {
              failedAlert(context, 'Belum Memilih Jenis Kerusakan');
            } else if (listGejala.isEmpty) {
              failedAlert(context, 'Belum Memilih Gejala');
            } else {
              modelAturan.isEdit!
                  ? getIt<AdminViewModel>()
                      .doEditAturan(context, kerusakan, listGejala, aturanId)

                  // ? print(aturanId)
                  : getIt<AdminViewModel>()
                      .doAddAturan(context, kerusakan, listGejala);
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
