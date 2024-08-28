import 'dart:convert';

DiagnosaAturanModel diagnosaAturanModelFromJson(String str) =>
    DiagnosaAturanModel.fromJson(json.decode(str));

String diagnosaAturanModelToJson(DiagnosaAturanModel data) =>
    json.encode(data.toJson());

class DiagnosaAturanModel {
  List<String>? gejala;
  String? kerusakan;

  DiagnosaAturanModel({
    this.gejala,
    this.kerusakan,
  });

  factory DiagnosaAturanModel.fromJson(Map<String, dynamic> json) =>
      DiagnosaAturanModel(
        gejala: json["gejala"],
        kerusakan: json["kerusakan"],
      );

  Map<String, dynamic> toJson() => {
        "gejala": gejala,
        "kerusakan": kerusakan,
      };
}
