import 'dart:convert';

ModelKerusakan modelKerusakanFromJson(String str) =>
    ModelKerusakan.fromJson(json.decode(str));

String modelKerusakanToJson(ModelKerusakan data) => json.encode(data.toJson());

class ModelKerusakan {
  String? kode;
  String? kerusakan;

  ModelKerusakan({
    this.kode,
    this.kerusakan,
  });

  factory ModelKerusakan.fromJson(Map<String, dynamic> json) => ModelKerusakan(
        kode: json["kode"],
        kerusakan: json["kerusakan"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "kerusakan": kerusakan,
      };
}
