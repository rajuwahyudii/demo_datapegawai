import 'package:cloud_firestore/cloud_firestore.dart';

class AdminService {
  Future<bool> editUser(
      String id, String email, String nama, String motor, String alamat) async {
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
          'email': email,
          'motor': motor,
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> aktivasiUser(bool status, String id) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('user')
          .where("id", isEqualTo: id)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        await doc.reference.update({
          'active': status,
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteAkun(
    String id,
  ) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('user')
          .where("id", isEqualTo: id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        await doc.reference.delete();
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
