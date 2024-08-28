import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiagnosaProvider extends ChangeNotifier {
  List<String> _listGejala = [];

  List<String> get listGejala => _listGejala;

  addListGejala(String gejala) {
    _listGejala.add(gejala);
    notifyListeners();
  }

  removeGejala(String gejala) {
    _listGejala.remove(gejala);
    notifyListeners();
  }

  static DiagnosaProvider read(context) {
    DiagnosaProvider providers = Provider.of<DiagnosaProvider>(
      context,
      listen: false,
    );
    return providers;
  }

  static DiagnosaProvider watch(context) {
    DiagnosaProvider providers = Provider.of<DiagnosaProvider>(
      context,
      listen: true,
    );
    return providers;
  }

  clear() {
    _listGejala = [];
  }
}
