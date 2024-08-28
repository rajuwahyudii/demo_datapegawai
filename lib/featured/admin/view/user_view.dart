import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/admin/view_model/admin_view_model.dart';
import 'package:demo/packages/get_it.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/Devider.dart';
import 'package:demo/shared/widget/alert.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:demo/shared/widget/button_widget.dart';
import 'package:demo/shared/widget/empty_page.dart';
import 'package:demo/shared/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  UserView({super.key});
  final TextEditingController _alamatController =
      TextEditingController(text: '');
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _motorController =
      TextEditingController(text: '');
  final TextEditingController _namaController = TextEditingController(text: '');

  onEditUser(
    context,
    String id,
    String nama,
    bool active,
  ) {
    _namaController.text = nama;

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
                  "Aktivasi Pegawai",
                  style: MyTextStyle.headerGreenBold14,
                ),
                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status User : ${active ? 'Aktif' : 'Tidak Aktif'}',
                      ),
                      Switch(
                          value: active,
                          onChanged: (value) {
                            active = true;
                            print(active);
                            print(value);
                          })
                    ],
                  ),
                ),

                ButtonWidget(
                  color: MyColor.greenColor,
                  textColor: MyColor.mainColor,
                  label: 'Simpan',
                  function: () {
                    getIt<AdminViewModel>().doEditUser(
                      context,
                      id,
                      _emailController.text,
                      _namaController.text,
                      _motorController.text,
                      _alamatController.text,
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
          'Akun',
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: SizedBox(
        width: getWidth(context),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .where('role', isEqualTo: 'user')
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
                          data[index]['nama'],
                          style: MyTextStyle.subHeaderSemibold14,
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                Routes.goAdminProfile(data[index]['id']);
                              },
                              icon: const Icon(
                                Icons.person,
                                color: MyColor.greenColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                data[index]['active']
                                    ? doubleAlert(context,
                                        title:
                                            'Apakah Anda Yakin Me-nonaktifkan User ini ?',
                                        titleButtonLeft: 'Batal',
                                        titleButtonRight: 'Yakin',
                                        onPressedLeft: () {
                                        Navigator.of(context).pop();
                                      }, onPressedRight: () {
                                        getIt<AdminViewModel>().doAktivasiUser(
                                            context, data[index]['id'], false);
                                        Navigator.of(context).pop();
                                      })
                                    : doubleAlert(context,
                                        title:
                                            'Apakah Anda Yakin Aktifkan User ini ?',
                                        titleButtonLeft: 'Batal',
                                        titleButtonRight: 'Yakin',
                                        onPressedLeft: () {
                                        Navigator.of(context).pop();
                                      }, onPressedRight: () {
                                        getIt<AdminViewModel>().doAktivasiUser(
                                          context,
                                          data[index]['id'],
                                          true,
                                        );
                                        Navigator.of(context).pop();
                                      });
                              },
                              icon: Icon(
                                data[index]['active']
                                    ? Icons.radio_button_checked_outlined
                                    : Icons.radio_button_off_outlined,
                                color: data[index]['active']
                                    ? MyColor.greenColor
                                    : MyColor.grayColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                doubleAlert(context,
                                    title: 'Hapus Akun ?',
                                    titleButtonLeft: 'Batal',
                                    titleButtonRight: 'Hapus',
                                    onPressedLeft: () {
                                  Navigator.of(context).pop();
                                }, onPressedRight: () {
                                  Navigator.of(context).pop();
                                  getIt<AdminViewModel>()
                                      .doDeleteAkun(context, data[index]['id']);
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
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
