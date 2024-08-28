import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/featured/diagnosa/model/aturan_diagnosa_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class DiagnosaService {
  Future<bool> addHistoryDiagnosa(String kerusakan) async {
    try {
      await FirebaseFirestore.instance.collection('history').add({
        'kerusakan': kerusakan,
        'user_id': FirebaseAuth.instance.currentUser!.uid,
        'created_at': DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> diagnoseForwardChaining(
      List<String> symptoms, List<DiagnosaAturanModel> rules) async {
    if (symptoms.length > 4) {
      return 'Diagnosis inconclusive.';
    }
    for (final rule in rules) {
      final ruleSymptoms = rule.gejala as List<String>;
      if (ruleSymptoms.every((symptom) => symptoms.contains(symptom))) {
        return rule.kerusakan as String;
      }
    }
    return 'Diagnosis inconclusive.';
  }

  Future<List<DiagnosaAturanModel>> getRulesFromFirestore() async {
    final firestore = FirebaseFirestore.instance;

    final ruleCollection = firestore.collection('aturan');

    final querySnapshot = await ruleCollection.get();

    final List<DiagnosaAturanModel> rules = [];

    for (final document in querySnapshot.docs) {
      final variableSubcollection = document.reference.collection('gejala');
      final variableSnapshot = await variableSubcollection.get();
      final DiagnosaAturanModel rule = DiagnosaAturanModel(
        kerusakan: document['kerusakan'] as String,
        gejala: [],
      );

      for (final variableDoc in variableSnapshot.docs) {
        final String variable = variableDoc.data()['gejala'] as String;
        rule.gejala!.add(variable);
      }
      rules.add(rule);
    }

    return rules;
  }
}
