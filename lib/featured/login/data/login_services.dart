import 'package:firebase_auth/firebase_auth.dart';

class LoginServices {
  Future<bool> signIn(String email, password) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
