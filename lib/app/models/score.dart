// To parse this JSON data, do
//
//     final scoreModel = scoreModelFromJson(jsonString);

import 'dart:convert';

ScoreModel scoreModelFromJson(String str) =>
    ScoreModel.fromJson(json.decode(str));

String scoreModelToJson(ScoreModel data) => json.encode(data.toJson());

class ScoreModel {
  int protocolos;
  int internacoes;
  int remocoes;
  int ocupados;
  int perc;

  ScoreModel({
    this.protocolos,
    this.internacoes,
    this.remocoes,
    this.ocupados,
    this.perc,
  });

  factory ScoreModel.fromJson(Map<String, dynamic> json) => ScoreModel(
        protocolos: json["protocolos"],
        internacoes: json["internacoes"],
        remocoes: json["remocoes"],
        ocupados: json["ocupados"],
        perc: json["perc"],
      );

  Map<String, dynamic> toJson() => {
        "protocolos": protocolos,
        "internacoes": internacoes,
        "remocoes": remocoes,
        "ocupados": ocupados,
        "perc": perc,
      };
}
