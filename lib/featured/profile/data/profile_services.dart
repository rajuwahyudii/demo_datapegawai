import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileServices {
  Future<bool> editProfile(
    String id,
    String nama,
    String alamat,
    String ktp,
    String tempatLahir,
    String agama,
    String jenisKelamin,
    String golonganDarah,
    String jabatan,
  ) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('user')
          .where("id", isEqualTo: id)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        await doc.reference.update({
          'nama': nama,
          'alamat': alamat,
          'ktp': ktp,
          'jenis_kelamin': jenisKelamin,
          'tempat_lahir': tempatLahir,
          'goldar': golonganDarah,
          'agama': agama,
          'jabatan': jabatan,
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
