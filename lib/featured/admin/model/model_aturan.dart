import 'dart:convert';

ModelAturan modelAturanFromJson(String str) =>
    ModelAturan.fromJson(json.decode(str));

String modelAturanToJson(ModelAturan data) => json.encode(data.toJson());

class ModelAturan {
  bool? isEdit = false;
  List<String>? gejala;
  String? kerusakan;

  ModelAturan({
    this.gejala,
    this.isEdit,
    this.kerusakan,
  });

  factory ModelAturan.fromJson(Map<String, dynamic> json) => ModelAturan(
        isEdit: json["is_edit"],
        gejala: json["gejala"],
        kerusakan: json["kerusakan"],
      );

  Map<String, dynamic> toJson() => {
        "is_edit": isEdit,
        "gejala": gejala,
        "kerusakan": kerusakan,
      };
}
