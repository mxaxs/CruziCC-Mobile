// To parse this JSON data, do
//
//     final pacienteModel = pacienteModelFromJson(jsonString);

import 'dart:convert';

PacienteModel pacienteModelFromJson(String str) =>
    PacienteModel.fromJson(json.decode(str));

String pacienteModelToJson(PacienteModel data) => json.encode(data.toJson());

class PacienteModel {
  Doc doc;

  PacienteModel({
    this.doc,
  });

  factory PacienteModel.fromJson(Map<String, dynamic> json) => PacienteModel(
        doc: json["doc"] == null ? null : Doc.fromJson(json["doc"]),
      );

  Map<String, dynamic> toJson() => {
        "doc": doc == null ? null : doc.toJson(),
      };
}

class Doc {
  Cid cid;
  String id;
  String pulseira;
  String leito;
  List<Medico> medicos;
  DateTime data;
  int patientId;
  String plano;
  bool interconsulta;
  bool isolamento;
  String hcr;
  String are;
  bool protocolosAvc;
  bool protocolosDorToracica;
  bool protocolosSepse;
  bool ucc;
  bool internacaoSolicitada;
  bool internacaoPrescrita;
  bool leitoTerreo;
  bool ecg;
  bool tc;
  bool rx;
  bool laboratorial;
  bool liquor;
  bool usg;
  bool remocaoSolicitada;
  bool remocaoEncaminhada;
  bool encaminhadoEnfermaria;
  bool encaminhadoUti;
  bool encaminhadoCentroCirurgico;
  bool altaMedica;
  bool altaRevelia;
  dynamic leitoLiberado;

  Doc(
      {this.cid,
      this.id,
      this.pulseira,
      this.leito,
      this.medicos,
      this.data,
      this.patientId,
      this.plano,
      this.interconsulta,
      this.isolamento,
      this.hcr,
      this.are,
      this.protocolosAvc,
      this.protocolosDorToracica,
      this.protocolosSepse,
      this.ucc,
      this.internacaoSolicitada,
      this.internacaoPrescrita,
      this.leitoTerreo,
      this.ecg,
      this.tc,
      this.rx,
      this.laboratorial,
      this.liquor,
      this.usg,
      this.remocaoSolicitada,
      this.remocaoEncaminhada,
      this.encaminhadoEnfermaria,
      this.encaminhadoUti,
      this.encaminhadoCentroCirurgico,
      this.altaMedica,
      this.altaRevelia,
      this.leitoLiberado});

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
      cid: json["cid"] == null ? null : Cid.fromJson(json["cid"]),
      id: json["_id"] == null ? null : json["_id"],
      pulseira: json["pulseira"] == null ? null : json["pulseira"],
      leito: json["leito"] == null ? null : json["leito"],
      medicos: json["medicos"] == null
          ? null
          : List<Medico>.from(json["medicos"].map((x) => Medico.fromJson(x))),
      data: json["data"] == null ? null : DateTime.parse(json["data"]),
      patientId: json["patient_id"] == null ? null : json["patient_id"],
      plano: json["plano"] == null ? null : json["plano"],
      interconsulta:
          json["interconsulta"] == null ? null : json["interconsulta"],
      isolamento: json["isolamento"] == null ? null : json["isolamento"],
      hcr: json["hcr"] == null ? null : json["hcr"],
      are: json["are"] == null ? null : json["are"],
      protocolosAvc:
          json["protocolos_avc"] == null ? null : json["protocolos_avc"],
      protocolosDorToracica: json["protocolos_dor_toracica"] == null
          ? null
          : json["protocolos_dor_toracica"],
      protocolosSepse:
          json["protocolos_sepse"] == null ? null : json["protocolos_sepse"],
      ucc: json["ucc"] == null ? null : json["ucc"],
      internacaoSolicitada: json["internacao_solicitada"] == null
          ? null
          : json["internacao_solicitada"],
      internacaoPrescrita: json["internacao_prescrita"] == null
          ? null
          : json["internacao_prescrita"],
      leitoTerreo: json["leito_terreo"] == null ? null : json["leito_terreo"],
      ecg: json["ecg"] == null ? null : json["ecg"],
      tc: json["tc"] == null ? null : json["tc"],
      rx: json["rx"] == null ? null : json["rx"],
      laboratorial: json["laboratorial"] == null ? null : json["laboratorial"],
      liquor: json["liquor"] == null ? null : json["liquor"],
      usg: json["usg"] == null ? null : json["usg"],
      remocaoSolicitada: json["remocao_solicitada"] == null
          ? null
          : json["remocao_solicitada"],
      remocaoEncaminhada: json["remocao_encaminhada"] == null
          ? null
          : json["remocao_encaminhada"],
      encaminhadoEnfermaria: json["encaminhado_enfermaria"] == null
          ? null
          : json["encaminhado_enfermaria"],
      encaminhadoUti:
          json["encaminhado_uti"] == null ? null : json["encaminhado_uti"],
      encaminhadoCentroCirurgico: json["encaminhado_centro_cirurgico"] == null
          ? null
          : json["encaminhado_centro_cirurgico"],
      altaMedica: json["alta_medica"] == null ? null : json["alta_medica"],
      altaRevelia: json["alta_revelia"] == null ? null : json["alta_revelia"],
      leitoLiberado: json["leito_liberado"]);

  Map<String, dynamic> toJson() => {
        "cid": cid == null ? null : cid.toJson(),
        "_id": id == null ? null : id,
        "pulseira": pulseira == null ? null : pulseira,
        "leito": leito == null ? null : leito,
        "medicos": medicos == null
            ? null
            : List<dynamic>.from(medicos.map((x) => x.toJson())),
        "data": data == null ? null : data.toIso8601String(),
        "patient_id": patientId == null ? null : patientId,
        "plano": plano == null ? null : plano,
        "interconsulta": interconsulta == null ? null : interconsulta,
        "isolamento": isolamento == null ? null : isolamento,
        "hcr": hcr == null ? null : hcr,
        "are": are == null ? null : are,
        "protocolos_avc": protocolosAvc == null ? null : protocolosAvc,
        "protocolos_dor_toracica":
            protocolosDorToracica == null ? null : protocolosDorToracica,
        "protocolos_sepse": protocolosSepse == null ? null : protocolosSepse,
        "ucc": ucc == null ? null : ucc,
        "internacao_solicitada":
            internacaoSolicitada == null ? null : internacaoSolicitada,
        "internacao_prescrita":
            internacaoPrescrita == null ? null : internacaoPrescrita,
        "leito_terreo": leitoTerreo == null ? null : leitoTerreo,
        "ecg": ecg == null ? null : ecg,
        "tc": tc == null ? null : tc,
        "rx": rx == null ? null : rx,
        "laboratorial": laboratorial == null ? null : laboratorial,
        "liquor": liquor == null ? null : liquor,
        "usg": usg == null ? null : usg,
        "remocao_solicitada":
            remocaoSolicitada == null ? null : remocaoSolicitada,
        "remocao_encaminhada":
            remocaoEncaminhada == null ? null : remocaoEncaminhada,
        "encaminhado_enfermaria":
            encaminhadoEnfermaria == null ? null : encaminhadoEnfermaria,
        "encaminhado_uti": encaminhadoUti == null ? null : encaminhadoUti,
        "encaminhado_centro_cirurgico": encaminhadoCentroCirurgico == null
            ? null
            : encaminhadoCentroCirurgico,
        "alta_medica": altaMedica == null ? null : altaMedica,
        "alta_revelia": altaRevelia == null ? null : altaRevelia,
        "leito_liberado": leitoLiberado
      };
}

class Cid {
  String codigo;
  String nome;

  Cid({
    this.codigo,
    this.nome,
  });

  factory Cid.fromJson(Map<String, dynamic> json) => Cid(
        codigo: json["codigo"] == null ? null : json["codigo"],
        nome: json["nome"] == null ? null : json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo == null ? null : codigo,
        "nome": nome == null ? null : nome,
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
        data: json["data"] == null ? null : DateTime.parse(json["data"]),
        id: json["_id"] == null ? null : json["_id"],
        crm: json["crm"] == null ? null : json["crm"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toIso8601String(),
        "_id": id == null ? null : id,
        "crm": crm == null ? null : crm,
        "token": token == null ? null : token,
      };
}
