import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterServices {
  Future<bool> signUp(String email, String password, String nama) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance.collection('user').add({
        'ktp': '',
        'tempat_lahir': '',
        'tanggal_lahir': '',
        'jenis_kelamin': '',
        'agama': '',
        'goldar': '',
        'alamat': '',
        'jabatan': '',
        'email': email,
        'nama': nama,
        'role': 'user',
        'active': false,
        'id': FirebaseAuth.instance.currentUser!.uid
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
