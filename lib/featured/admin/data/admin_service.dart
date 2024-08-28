import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/featured/admin/state/admin_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class AdminService {
  Future<bool> addKerusakan(
      String kode, String kerusakan, String solusi) async {
    try {
      await FirebaseFirestore.instance.collection('kerusakan').add({
        'id': const Uuid().v4(),
        'kode': kode,
        'kerusakan': kerusakan,
        'solusi': solusi,
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> editKerusakan(
      String id, String kode, String kerusakan, String solusi) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('kerusakan')
          .where("id", isEqualTo: id)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        await doc.reference.update({
          'kode': kode,
          'kerusakan': kerusakan,
          'solusi': solusi,
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

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

  Future<bool> deleteKerusakan(
    String id,
  ) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('kerusakan')
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

  Future<bool> addAturan(List<String> listGejala, String kerusakan) async {
    final docRef = FirebaseFirestore.instance.collection('aturan');
    final id = const Uuid().v4();
    try {
      await docRef.add({
        'id': id,
        'kerusakan': kerusakan,
      });
      final gejalaData =
          listGejala.map((gejala) => {'gejala': gejala}).toList();
      await docRef.where('id', isEqualTo: id).get().then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          for (var doc in querySnapshot.docs) {
            CollectionReference subcollectionRef =
                doc.reference.collection('gejala');

            for (final data in gejalaData) {
              subcollectionRef.add(data);
            }
          }
        } else {
          debugPrint('No documents found for the given id.');
        }
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> editAturan(
      List<String> listGejala, String kerusakan, String id) async {
    final docRef = FirebaseFirestore.instance.collection('aturan');

    try {
      final firestore = FirebaseFirestore.instance;
      final aturanCollection = firestore.collection('aturan');

      final query = aturanCollection.where('id', isEqualTo: id);

      final querySnapshotStream = query.snapshots();

      querySnapshotStream.listen((querySnapshot) {
        for (final doc in querySnapshot.docs) {
          final docId = doc.id;
          deleteGejalaSubcollection(docId);
        }
      });

      final gejalaData =
          listGejala.map((gejala) => {'gejala': gejala}).toList();
      await docRef.where('id', isEqualTo: id).get().then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          for (var doc in querySnapshot.docs) {
            CollectionReference subcollectionRef =
                doc.reference.collection('gejala');

            for (final data in gejalaData) {
              subcollectionRef.add(data);
            }
          }
        } else {
          debugPrint('No documents found for the given id.');
        }
      });
      final querySnapshot = await query.limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        await doc.reference.update({
          'kerusakan': kerusakan,
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteAturan(
    String id,
  ) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final aturanCollection = firestore.collection('aturan');

      final query = aturanCollection.where('id', isEqualTo: id);

      final querySnapshotStream = query.snapshots();

      querySnapshotStream.listen((querySnapshot) {
        for (final doc in querySnapshot.docs) {
          final docId = doc.id;
          deleteGejalaSubcollection(docId);
        }
      });
      final querySnapshot = await query.get();
      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        await doc.reference.delete();
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> gejalaEdit(context, String id) async {
    try {
      AdminProvider.read(context).setListGejala([]);
      final firestore = FirebaseFirestore.instance;
      final aturanCollection = firestore.collection('aturan');

      final query = aturanCollection.where('id', isEqualTo: id);

      final querySnapshotStream = query.snapshots();
      querySnapshotStream.listen((querySnapshot) {
        for (final doc in querySnapshot.docs) {
          final docId = doc.id;
          setGejalaEdit(context, docId);
        }
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> setGejalaEdit(context, String documentId) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final aturanDocRef = firestore.collection('aturan').doc(documentId);
      final gejalaCollectionRef = aturanDocRef.collection('gejala');

      await gejalaCollectionRef.get().then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          AdminProvider.read(context).addListGejala(doc['gejala']);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteGejalaSubcollection(String documentId) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final aturanDocRef = firestore.collection('aturan').doc(documentId);
      final gejalaCollectionRef = aturanDocRef.collection('gejala');

      await gejalaCollectionRef.get().then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          doc.reference.delete();
        }
      });

      debugPrint("Gejala subcollection deleted for document: $documentId");
    } catch (e) {
      debugPrint("Error deleting gejala subcollection: $e");
    }
  }

  Future<bool> addGejala(String kode, String gejala) async {
    try {
      await FirebaseFirestore.instance.collection('gejala').add({
        'id': const Uuid().v4(),
        'kode': kode,
        'gejala': gejala,
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> editGejala(String id, String kode, String gejala) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('gejala')
          .where("id", isEqualTo: id)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        await doc.reference.update({
          'kode': kode,
          'gejala': gejala,
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteGejala(
    String id,
  ) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('gejala')
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
