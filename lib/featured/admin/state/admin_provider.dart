import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminProvider extends ChangeNotifier {
  String _id = '';
  String get id => _id;
  setId(String newId) {
    _id = newId;
    notifyListeners();
  }

  List<String> _listGejala = [];

  List<String> get listGejala => _listGejala;

  addListGejala(String gejala) {
    _listGejala.add(gejala);
    notifyListeners();
  }

  setListGejala(List<String> gejala) {
    _listGejala = gejala;
    notifyListeners();
  }

  removeGejala(String gejala) {
    _listGejala.remove(gejala);
    notifyListeners();
  }

  String _kerusakan = '';
  String get kerusakan => _kerusakan;

  setKerusakan(String newKerusakan) {
    _kerusakan = newKerusakan;
    notifyListeners();
  }

  static AdminProvider read(context) {
    AdminProvider providers = Provider.of<AdminProvider>(
      context,
      listen: false,
    );
    return providers;
  }

  static AdminProvider watch(context) {
    AdminProvider providers = Provider.of<AdminProvider>(
      context,
      listen: true,
    );
    return providers;
  }

  clear() {
    _listGejala = [];
    _kerusakan = '';
  }
}
