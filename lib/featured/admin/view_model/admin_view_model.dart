import 'package:demo/featured/admin/data/admin_service.dart';
import 'package:demo/shared/widget/alert.dart';

class AdminViewModel extends AdminService {
  doEditUser(context, String id, String email, String nama, String motor,
      String alamat) async {
    bool response = await editUser(id, email, nama, motor, alamat);
    if (response == true) {
      successAlert(context, 'Ubah Akun Sukses');
    } else {
      failedAlert(context, 'Ubah Akun Gagal');
    }
  }

  doAktivasiUser(context, String id, bool status) async {
    bool response = await aktivasiUser(
      status,
      id,
    );
    if (response == true) {
      successAlert(context, 'Perubahan Status Sukses');
    } else {
      failedAlert(context, 'Perubahan Status Gagal');
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
}
