import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User user = auth.currentUser!;
  // ignore: non_constant_identifier_names
  static Stream<User?> get FirebaseUserStream => auth.authStateChanges();
}
