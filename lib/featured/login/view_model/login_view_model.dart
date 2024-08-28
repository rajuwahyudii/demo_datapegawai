import 'package:demo/featured/login/data/login_services.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/widget/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends LoginServices {
  doLogin(context, String email, String password) async {
    bool response = await signIn(email, password);
    if (response == true) {
      successAlert(context, 'Login Sukses').then((value) {
        if (FirebaseAuth.instance.currentUser != null) {
          Routes.goHome();
        }
      });
    } else {
      failedAlert(context, 'Login Gagal');
    }
  }
}
