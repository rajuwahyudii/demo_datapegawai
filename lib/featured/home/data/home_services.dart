import 'package:firebase_auth/firebase_auth.dart';

class HomeServices {
  Future<bool> signOut() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
