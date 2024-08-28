import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/profile/view_model/profile_view_model.dart';
import 'package:demo/featured/profile/widget/data_profile.dart';
import 'package:demo/packages/get_it.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:demo/shared/widget/button_widget.dart';
import 'package:demo/shared/widget/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final TextEditingController _namaController = TextEditingController(text: '');
  final TextEditingController _agamaController =
      TextEditingController(text: '');

  final TextEditingController _tempatLahirController =
      TextEditingController(text: '');

  final TextEditingController _ktpController = TextEditingController(text: '');
  final TextEditingController _alamatController =
      TextEditingController(text: '');
  final TextEditingController _jenisKelaminController =
      TextEditingController(text: '');
  final TextEditingController _golonganDarahController =
      TextEditingController(text: '');
  final TextEditingController _jabatanController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    onEditUser(
      context,
      String id,
      String nama,
      String alamat,
      String ktp,
      String tempatLahir,
      String agama,
      String jenisKelamin,
      String golonganDarah,
      String jabatan,
      bool active,
    ) {
      _namaController.text = nama;
      _ktpController.text = ktp;
      _alamatController.text = alamat;

      _tempatLahirController.text = tempatLahir;

      _agamaController.text = agama;

      _jenisKelaminController.text = jenisKelamin;
      _golonganDarahController.text = golonganDarah;
      _jabatanController.text = jabatan;

      // _activePegawai = active;
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
                  const SizedBox(height: 16),
                  const Text(
                    "Ubah Profil",
                    style: MyTextStyle.headerGreenBold14,
                  ),
                  const SizedBox(height: 16),
                  MyTextFormField(
                    maxLength: 500,
                    maxLines: 1,
                    hint: "Nama",
                    keyboardType: TextInputType.name,
                    controller: _namaController,
                  ),
                  MyTextFormField(
                    maxLength: 500,
                    maxLines: 1,
                    hint: "No KTP",
                    keyboardType: TextInputType.number,
                    controller: _ktpController,
                  ),
                  MyTextFormField(
                    maxLength: 500,
                    maxLines: 1,
                    hint: "Alamat",
                    keyboardType: TextInputType.streetAddress,
                    controller: _alamatController,
                  ),
                  MyTextFormField(
                    maxLength: 500,
                    maxLines: 1,
                    hint: "Tempat Lahir",
                    keyboardType: TextInputType.name,
                    controller: _tempatLahirController,
                  ),
                  MyTextFormField(
                    maxLength: 500,
                    maxLines: 1,
                    hint: "Agama",
                    keyboardType: TextInputType.name,
                    controller: _agamaController,
                  ),
                  MyTextFormField(
                    maxLength: 500,
                    maxLines: 1,
                    hint: "Jenis Kelamin",
                    keyboardType: TextInputType.name,
                    controller: _jenisKelaminController,
                  ),
                  MyTextFormField(
                    maxLength: 500,
                    maxLines: 1,
                    hint: "Golongan Darah",
                    keyboardType: TextInputType.name,
                    controller: _golonganDarahController,
                  ),
                  MyTextFormField(
                    maxLength: 500,
                    maxLines: 1,
                    hint: "Jabatan",
                    keyboardType: TextInputType.name,
                    controller: _jabatanController,
                  ),
                  ButtonWidget(
                    color: MyColor.greenColor,
                    textColor: MyColor.mainColor,
                    label: 'Simpan',
                    function: () {
                      getIt<ProfileViewModel>().doEditProfile(
                        context,
                        id,
                        _namaController.text,
                        _alamatController.text,
                        _ktpController.text,
                        _agamaController.text,
                        _tempatLahirController.text,
                        _jenisKelaminController.text,
                        _golonganDarahController.text,
                        _jabatanController.text,
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        elevation: 0,
        leading: ArrowBackWidget(
          color: MyColor.mainColor,
        ),
        title: const Text(
          'Profil',
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: MyColor.mainColor,
          width: getWidth(context),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .where('id',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                      data: data.first['active'] ? "Aktif" : "Tidak Aktif",
                      label: 'Status',
                    ),
                    DataProfileWidget(
                      data: data.first['alamat'] != ''
                          ? data.first['alamat']
                          : 'No Data',
                      label: 'Alamat',
                    ),
                    DataProfileWidget(
                      data: data.first['agama'] != ''
                          ? data.first['agama']
                          : 'No Data',
                      label: 'Agama',
                    ),
                    DataProfileWidget(
                      data: data.first['goldar'] != ''
                          ? data.first['goldar']
                          : 'No Data',
                      label: 'Golongan Darah',
                    ),
                    DataProfileWidget(
                      data: data.first['jenis_kelamin'] != ''
                          ? data.first['jenis_kelamin']
                          : 'No Data',
                      label: 'Jenis Kelamin',
                    ),
                    DataProfileWidget(
                      data: data.first['tempat_lahir'] != ''
                          ? data.first['tempat_lahir']
                          : 'No Data',
                      label: 'Tempat Lahir',
                    ),
                    DataProfileWidget(
                      data: data.first['jabatan'] != ''
                          ? data.first['jabatan']
                          : 'No Data',
                      label: 'Jabatan',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ButtonWidget(
                        color: MyColor.greenColor,
                        textColor: MyColor.mainColor,
                        label: 'Ubah Profil',
                        function: () {
                          onEditUser(
                            context,
                            data.first['id'],
                            data.first['nama'],
                            data.first['alamat'],
                            data.first['ktp'],
                            data.first['tempat_lahir'],
                            data.first['agama'],
                            data.first['jenis_kelamin'],
                            data.first['goldar'],
                            data.first['jabatan'],
                            true,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
