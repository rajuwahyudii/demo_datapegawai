import 'package:demo/featured/admin/data/admin_service.dart';
import 'package:demo/shared/widget/alert.dart';

class AdminViewModel extends AdminService {
  doAddGejala(context, String kode, String nama) async {
    bool response = await addGejala(kode, nama);
    if (response == true) {
      successAlert(context, 'Tambah Gejala Sukses');
    } else {
      failedAlert(context, 'Tambah Gejala Gagal');
    }
  }

  doEditGejala(context, String id, String kode, String nama) async {
    bool response = await editGejala(id, kode, nama);
    if (response == true) {
      successAlert(context, 'Ubah Gejala Sukses');
    } else {
      failedAlert(context, 'Ubah Gejala Gagal');
    }
  }

  doDeleteGejala(context, String id) async {
    bool response = await deleteGejala(id);
    if (response == true) {
      successAlert(context, 'Hapus Gejala Sukses');
    } else {
      failedAlert(context, 'Hapus Gejala Gagal');
    }
  }

  doAddKerusakan(context, String kode, String nama, String solusi) async {
    bool response = await addKerusakan(kode, nama, solusi);
    if (response == true) {
      successAlert(context, 'Tambah Kerusakan Sukses');
    } else {
      failedAlert(context, 'Tambah Kerusakan Gagal');
    }
  }

  doEditUser(context, String id, String email, String nama, String motor,
      String alamat) async {
    bool response = await editUser(id, email, nama, motor, alamat);
    if (response == true) {
      successAlert(context, 'Ubah Akun Sukses');
    } else {
      failedAlert(context, 'Ubah Akun Gagal');
    }
  }

  doEditKerusakan(
      context, String id, String kode, String nama, String solusi) async {
    bool response = await editKerusakan(id, kode, nama, solusi);
    if (response == true) {
      successAlert(context, 'Ubah Kerusakan Sukses');
    } else {
      failedAlert(context, 'Ubah Kerusakan Gagal');
    }
  }

  doDeleteAkun(context, String id) async {
    bool response = await deleteAkun(id);
    if (response == true) {
      successAlert(context, 'Hapus Akun Sukses');
    } else {
      failedAlert(context, 'Hapus Akun Gagal');
    }
  }

  doDeleteKerusakan(context, String id) async {
    bool response = await deleteKerusakan(id);
    if (response == true) {
      successAlert(context, 'Hapus Kerusakan Sukses');
    } else {
      failedAlert(context, 'Hapus Kerusakan Gagal');
    }
  }

  doAddAturan(context, String kerusakan, List<String> gejala) async {
    bool response = await addAturan(gejala, kerusakan);
    if (response == true) {
      successAlert(context, 'Tambah Aturan Sukses');
    } else {
      failedAlert(context, 'Tambah Aturan Gagal');
    }
  }

  doEditAturan(
      context, String kerusakan, List<String> gejala, String id) async {
    bool response = await editAturan(gejala, kerusakan, id);
    if (response == true) {
      successAlert(context, 'Edit Aturan Sukses');
    } else {
      failedAlert(context, 'Edit Aturan Gagal');
    }
  }

  doDeleteAturan(context, String id) async {
    bool response = await deleteAturan(id);
    if (response == true) {
      successAlert(context, 'Delete Aturan Sukses');
    } else {
      failedAlert(context, 'Delete Aturan Gagal');
    }
  }

  doSetGejalaEdit(context, String id) async {
    await gejalaEdit(context, id);
  }
}
