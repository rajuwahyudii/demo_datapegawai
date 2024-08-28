import 'package:demo/featured/register/data/register_services.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/widget/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewModel extends RegisterServices {
  doRegister(context, String email, String password, String nama, String nik,
      String alamat, String motor) async {
    bool response = await signUp(email, password, nama, nik, alamat, motor);
    if (response == true) {
      successAlert(context, 'Registrasi Sukses').then((value) {
        if (FirebaseAuth.instance.currentUser != null) {
          Routes.goHome();
        }
      });
    } else {
      failedAlert(context, 'Registrasi Gagal');
    }
  }
}
