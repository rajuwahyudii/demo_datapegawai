import 'package:demo/featured/profile/data/profile_services.dart';
import 'package:demo/shared/widget/alert.dart';

class ProfileViewModel extends ProfileServices {
  doEditProfile(
    context,
    String id,
    String nama,
    String alamat,
    String ktp,
    String agama,
    String tempat_lahir,
    String jenis_kelamin,
    String golonganDarah,
    String jabatan,
  ) async {
    bool response = await editProfile(
      id,
      nama,
      alamat,
      ktp,
      tempat_lahir,
      agama,
      jenis_kelamin,
      golonganDarah,
      jabatan,
    );
    if (response == true) {
      successAlert(context, 'Ubah Profile Sukses');
    } else {
      failedAlert(context, 'Ubah Profile Gagal');
    }
  }
}
