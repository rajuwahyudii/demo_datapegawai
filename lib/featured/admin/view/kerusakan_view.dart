import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/admin/view_model/admin_view_model.dart';
import 'package:demo/packages/get_it.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/Devider.dart';
import 'package:demo/shared/widget/alert.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:demo/shared/widget/button_widget.dart';
import 'package:demo/shared/widget/empty_page.dart';
import 'package:demo/shared/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class KerusakanView extends StatelessWidget {
  KerusakanView({super.key});
  final TextEditingController _kerusakanController =
      TextEditingController(text: '');
  final TextEditingController _kodeController = TextEditingController(text: '');
  final TextEditingController _solusiController =
      TextEditingController(text: '');
  onDetailKerusakan(
      context, String id, String nama, String kode, String solusi) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Container(
          decoration: const BoxDecoration(
            color: MyColor.mainColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
          ),
          width: getWidth(context),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                // Divider(width: 50, thickness: 2),
                const SizedBox(height: 16),
                const Text(
                  "Detail Kerusakan",
                  style: MyTextStyle.headerGreenBold14,
                ),
                const SizedBox(height: 16),
                Text(
                  kode,
                  style: MyTextStyle.headerGreenBold14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(nama),
                ),
                Text('solusi : $solusi'),

                SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
              ],
            ),
          ),
        );
      },
    );
  }

  onAddKerusakan(context) {
    _kerusakanController.clear();
    _kodeController.clear();
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Container(
          decoration: const BoxDecoration(
            color: MyColor.mainColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
          ),
          width: getWidth(context),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                // Divider(width: 50, thickness: 2),
                const SizedBox(height: 16),
                const Text(
                  "Tambah Kerusakan",
                  style: MyTextStyle.headerGreenBold14,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  maxLength: 500,
                  maxLines: 1,
                  hint: "Kode Kerusakan",
                  controller: _kodeController,
                ),
                MyTextFormField(
                  maxLength: 500,
                  maxLines: 5,
                  hint: "Nama Kerusakan",
                  controller: _kerusakanController,
                ),
                MyTextFormField(
                  maxLength: 500,
                  maxLines: 5,
                  hint: "Solusi Kerusakan",
                  controller: _solusiController,
                ),
                ButtonWidget(
                  color: MyColor.greenColor,
                  textColor: MyColor.mainColor,
                  label: 'Simpan',
                  function: () {
                    getIt<AdminViewModel>().doAddKerusakan(
                      context,
                      _kodeController.text,
                      _kerusakanController.text,
                      _solusiController.text,
                    );
                    Navigator.of(context).pop();
                  },
                ),

                SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
              ],
            ),
          ),
        );
      },
    );
  }

  onEditKerusakan(context, String id, String nama, String kode, String solusi) {
    _kerusakanController.text = nama;
    _kodeController.text = kode;
    _solusiController.text = solusi;

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Container(
          decoration: const BoxDecoration(
            color: MyColor.mainColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
          ),
          width: getWidth(context),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                // Divider(width: 50, thickness: 2),
                const SizedBox(height: 16),
                const Text(
                  "Ubah Kerusakan",
                  style: MyTextStyle.headerGreenBold14,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  maxLength: 500,
                  maxLines: 1,
                  hint: "Kode Kerusakan",
                  controller: _kodeController,
                ),
                MyTextFormField(
                  maxLength: 500,
                  maxLines: 5,
                  hint: "Nama Kerusakan",
                  controller: _kerusakanController,
                ),
                MyTextFormField(
                  maxLength: 500,
                  maxLines: 5,
                  hint: "Solusi Kerusakan",
                  controller: _solusiController,
                ),
                ButtonWidget(
                  color: MyColor.greenColor,
                  textColor: MyColor.mainColor,
                  label: 'Simpan',
                  function: () {
                    getIt<AdminViewModel>().doEditKerusakan(
                      context,
                      id,
                      _kodeController.text,
                      _kerusakanController.text,
                      _solusiController.text,
                    );
                    Navigator.of(context).pop();
                  },
                ),

                SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        leading: ArrowBackWidget(
          color: MyColor.mainColor,
        ),
        title: const Text(
          'Kerusakan',
          style: MyTextStyle.headerWhiteBold18,
        ),
        actions: [
          IconButton(
            onPressed: () {
              onAddKerusakan(context);
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
            stream: FirebaseFirestore.instance
                .collection('kerusakan')
                .orderBy('kode')
                .snapshots(),
            builder: (streamcontext, snapshot) {
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
                itemCount: data.length,
                itemBuilder: (BuildContext listcontext, int index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Kerusakan:\n${data[index]['kerusakan']}',
                          style: MyTextStyle.subHeaderSemibold14,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          data[index]['kode'],
                          style: MyTextStyle.bodyBlack14,
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                onDetailKerusakan(
                                  context,
                                  data[index]['id'],
                                  data[index]['kerusakan'],
                                  data[index]['kode'],
                                  data[index]['solusi'],
                                );
                              },
                              icon: const Icon(
                                Icons.details,
                                color: MyColor.greenColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                onEditKerusakan(
                                  context,
                                  data[index]['id'],
                                  data[index]['kerusakan'],
                                  data[index]['kode'],
                                  data[index]['solusi'],
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: MyColor.greenColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                doubleAlert(context,
                                    title:
                                        'Hapus Kerusakan ${data[index]['kode']} ?',
                                    titleButtonLeft: 'Batal',
                                    titleButtonRight: 'Hapus',
                                    onPressedLeft: () {
                                  Navigator.of(context).pop();
                                }, onPressedRight: () {
                                  Navigator.of(context).pop();
                                  getIt<AdminViewModel>().doDeleteKerusakan(
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
                      ),
                      DeviderWidget(
                        width: getWidth(context) * 0.8,
                        thickness: 2,
                        vPadding: 16,
                      )
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
