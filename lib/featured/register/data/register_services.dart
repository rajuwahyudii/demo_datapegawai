import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterServices {
  Future<bool> signUp(String email, String password, String nama, String nik,
      String alamat, String motor) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance.collection('user').add({
        'email': email,
        'nama': nama,
        'nik': nik,
        'alamat': alamat,
        'motor': motor,
        'role': 'user',
        'id': FirebaseAuth.instance.currentUser!.uid
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
