import 'dart:convert';

ModelGejala modelGejalaFromJson(String str) =>
    ModelGejala.fromJson(json.decode(str));

String modelGejalaToJson(ModelGejala data) => json.encode(data.toJson());

class ModelGejala {
  String? kode;
  String? gejala;

  ModelGejala({
    this.kode,
    this.gejala,
  });

  factory ModelGejala.fromJson(Map<String, dynamic> json) => ModelGejala(
        kode: json["kode"],
        gejala: json["gejala"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "gejala": gejala,
      };
}
