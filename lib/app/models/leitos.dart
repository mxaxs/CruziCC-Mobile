// To parse this JSON data, do
//
//     final leitosModel = leitosModelFromJson(jsonString);

import 'dart:convert';

LeitosModel leitosModelFromJson(String str) =>
    LeitosModel.fromJson(json.decode(str));

String leitosModelToJson(LeitosModel data) => json.encode(data.toJson());

class LeitosModel {
  List<Leito> leitos;

  LeitosModel({
    this.leitos,
  });

  factory LeitosModel.fromJson(Map<String, dynamic> json) => LeitosModel(
        leitos: List<Leito>.from(json["leitos"].map((x) => Leito.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "leitos": List<dynamic>.from(leitos.map((x) => x.toJson())),
      };
}

class Leito {
  String id;
  String pulseira;
  String leito;
  List<Medico> medicos;
  String plano;

  Leito({
    this.id,
    this.pulseira,
    this.leito,
    this.medicos,
    this.plano,
  });

  factory Leito.fromJson(Map<String, dynamic> json) => Leito(
        id: json["_id"],
        pulseira: json["pulseira"],
        leito: json["leito"],
        medicos:
            List<Medico>.from(json["medicos"].map((x) => Medico.fromJson(x))),
        plano: json["plano"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "pulseira": pulseira,
        "leito": leito,
        "medicos": List<dynamic>.from(medicos.map((x) => x.toJson())),
        "plano": plano,
      };
}

class Medico {
  DateTime data;
  String id;
  String crm;
  String token;

  Medico({
    this.data,
    this.id,
    this.crm,
    this.token,
  });

  factory Medico.fromJson(Map<String, dynamic> json) => Medico(
        data: DateTime.parse(json["data"]),
        id: json["_id"],
        crm: json["crm"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toIso8601String(),
        "_id": id,
        "crm": crm,
        "token": token,
      };
}
