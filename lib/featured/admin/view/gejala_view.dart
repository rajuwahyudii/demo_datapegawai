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

class GejalaView extends StatelessWidget {
  GejalaView({super.key});
  final TextEditingController _gejalaController =
      TextEditingController(text: '');
  final TextEditingController _kodeController = TextEditingController(text: '');
  onAddGejala(context) {
    _gejalaController.clear();
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
                const SizedBox(height: 16),
                const Text(
                  "Tambah Gejala",
                  style: MyTextStyle.headerGreenBold14,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  maxLength: 500,
                  maxLines: 1,
                  hint: "Kode Gejala",
                  controller: _kodeController,
                ),
                MyTextFormField(
                  maxLength: 500,
                  maxLines: 5,
                  hint: "Nama Gejala Kerusakan",
                  controller: _gejalaController,
                ),
                ButtonWidget(
                  color: MyColor.greenColor,
                  textColor: MyColor.mainColor,
                  label: 'Simpan',
                  function: () {
                    getIt<AdminViewModel>().doAddGejala(
                        context, _kodeController.text, _gejalaController.text);
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

  onEditGejala(context, String id, String nama, String kode) {
    _gejalaController.text = nama;
    _kodeController.text = kode;
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
                  "Ubah Gejala",
                  style: MyTextStyle.headerGreenBold14,
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  maxLength: 500,
                  maxLines: 1,
                  hint: "Kode Gejala",
                  controller: _kodeController,
                ),
                MyTextFormField(
                  maxLength: 500,
                  maxLines: 5,
                  hint: "Nama Gejala Kerusakan",
                  controller: _gejalaController,
                ),
                ButtonWidget(
                  color: MyColor.greenColor,
                  textColor: MyColor.mainColor,
                  label: 'Simpan',
                  function: () {
                    getIt<AdminViewModel>().doEditGejala(context, id,
                        _kodeController.text, _gejalaController.text);
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
          'Gejala',
          style: MyTextStyle.headerWhiteBold18,
        ),
        actions: [
          IconButton(
            onPressed: () {
              onAddGejala(context);
            },
            icon: const Icon(
              Icons.add,
              color: MyColor.mainColor,
            ),
          ),
        ],
      ),
      body: SizedBox(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('gejala')
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
                        'Gejala Kerusakan: \n${data[index]['gejala']}',
                        style: MyTextStyle.subHeaderSemibold14,
                      ),
                      subtitle: Text(
                        data[index]['kode'],
                        style: MyTextStyle.bodyBlack14,
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              onEditGejala(
                                context,
                                data[index]['id'],
                                data[index]['gejala'],
                                data[index]['kode'],
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
                                      'Hapus Gejala ${data[index]['kode']} ?',
                                  titleButtonLeft: 'Batal',
                                  titleButtonRight: 'Hapus', onPressedLeft: () {
                                Navigator.of(context).pop();
                              }, onPressedRight: () {
                                Navigator.of(context).pop();
                                getIt<AdminViewModel>()
                                    .doDeleteGejala(context, data[index]['id']);
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
          },
        ),
      ),
    );
  }
}
