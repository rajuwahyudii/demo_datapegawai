import 'package:demo/featured/diagnosa/data/diagnosa_service.dart';
import 'package:demo/featured/diagnosa/model/aturan_diagnosa_model.dart';
import 'package:flutter/foundation.dart';

class DiagnosaViewModel extends DiagnosaService {
  doAddHistory(context, String kerusakan) async {
    await addHistoryDiagnosa(kerusakan);
  }

  doDiagnose(context, List<String> kerusakan) async {
    List<DiagnosaAturanModel> rules = await getRulesFromFirestore();
    String response = await diagnoseForwardChaining(kerusakan, rules);
    addHistoryDiagnosa(response);
    debugPrint(response);
    return response;
  }
}
