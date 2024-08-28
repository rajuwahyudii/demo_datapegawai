import 'package:demo/featured/home/data/home_services.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/widget/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeViewModel extends HomeServices {
  doSignOut(context) async {
    bool response = await signOut();
    if (response == true) {
      successAlert(context, 'Logout Sukses').then((value) {
        if (FirebaseAuth.instance.currentUser == null) {
          Routes.goLogin();
        }
      });
    } else {
      failedAlert(context, 'Logout Gagal');
    }
  }
}
