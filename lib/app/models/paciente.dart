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
        doc: json["doc"] == null ? false : Doc.fromJson(json["doc"]),
      );

  Map<String, dynamic> toJson() => {
        "doc": doc == null ? false : doc.toJson(),
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
  bool outraEspecialidade;
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
  bool aguardaLeito;
  bool encaminhadoEnfermaria;
  bool encaminhadoUti;
  bool encaminhadoCentroCirurgico;
  bool altaMedica;
  bool altaRevelia;
  bool obito;
  bool evasao;
  dynamic leitoLiberado;

  Doc({
    this.cid,
    this.id,
    this.pulseira,
    this.leito,
    this.medicos,
    this.data,
    this.patientId,
    this.plano,
    this.outraEspecialidade,
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
    this.aguardaLeito,
    this.encaminhadoEnfermaria,
    this.encaminhadoUti,
    this.encaminhadoCentroCirurgico,
    this.altaMedica,
    this.altaRevelia,
    this.obito,
    this.evasao,
    this.leitoLiberado,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        cid: json["cid"] == null ? null : Cid.fromJson(json["cid"]),
        id: json["_id"] == null ? false : json["_id"],
        pulseira: json["pulseira"] == null ? null : json["pulseira"],
        leito: json["leito"] == null ? false : json["leito"],
        medicos: json["medicos"] == null
            ? null
            : List<Medico>.from(json["medicos"].map((x) => Medico.fromJson(x))),
        data: json["data"] == null ? null : DateTime.parse(json["data"]),
        patientId: json["patient_id"] == null ? "" : json["patient_id"],
        plano: json["plano"] == null ? "" : json["plano"],
        outraEspecialidade: json["outra_especialidade"] == null
            ? false
            : json["outra_especialidade"],
        interconsulta:
            json["interconsulta"] == null ? false : json["interconsulta"],
        isolamento: json["isolamento"] == null ? false : json["isolamento"],
        hcr: json["hcr"] == null ? "" : json["hcr"],
        are: json["are"] == null ? "" : json["are"],
        protocolosAvc:
            json["protocolos_avc"] == null ? false : json["protocolos_avc"],
        protocolosDorToracica: json["protocolos_dor_toracica"] == null
            ? null
            : json["protocolos_dor_toracica"],
        protocolosSepse:
            json["protocolos_sepse"] == null ? false : json["protocolos_sepse"],
        ucc: json["ucc"] == null ? false : json["ucc"],
        internacaoSolicitada: json["internacao_solicitada"] == null
            ? null
            : json["internacao_solicitada"],
        internacaoPrescrita: json["internacao_prescrita"] == null
            ? null
            : json["internacao_prescrita"],
        leitoTerreo:
            json["leito_terreo"] == null ? false : json["leito_terreo"],
        ecg: json["ecg"] == null ? false : json["ecg"],
        tc: json["tc"] == null ? false : json["tc"],
        rx: json["rx"] == null ? false : json["rx"],
        laboratorial:
            json["laboratorial"] == null ? false : json["laboratorial"],
        liquor: json["liquor"] == null ? false : json["liquor"],
        usg: json["usg"] == null ? false : json["usg"],
        remocaoSolicitada: json["remocao_solicitada"] == null
            ? null
            : json["remocao_solicitada"],
        remocaoEncaminhada: json["remocao_encaminhada"] == null
            ? null
            : json["remocao_encaminhada"],
        aguardaLeito:
            json["aguarda_leito"] == null ? false : json["aguarda_leito"],
        encaminhadoEnfermaria: json["encaminhado_enfermaria"] == null
            ? null
            : json["encaminhado_enfermaria"],
        encaminhadoUti:
            json["encaminhado_uti"] == null ? false : json["encaminhado_uti"],
        encaminhadoCentroCirurgico: json["encaminhado_centro_cirurgico"] == null
            ? null
            : json["encaminhado_centro_cirurgico"],
        altaMedica: json["alta_medica"] == null ? false : json["alta_medica"],
        altaRevelia:
            json["alta_revelia"] == null ? false : json["alta_revelia"],
        obito: json["obito"] == null ? false : json["obito"],
        evasao: json["evasao"] == null ? false : json["evasao"],
        leitoLiberado: json["leito_liberado"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid == null ? "" : cid.toJson(),
        "_id": id == null ? false : id,
        "pulseira": pulseira == null ? false : pulseira,
        "leito": leito == null ? false : leito,
        "medicos": medicos == null
            ? null
            : List<dynamic>.from(medicos.map((x) => x.toJson())),
        "data": data == null ? false : data.toIso8601String(),
        "patient_id": patientId == null ? false : patientId,
        "plano": plano == null ? false : plano,
        "outra_especialidade":
            outraEspecialidade == null ? false : outraEspecialidade,
        "interconsulta": interconsulta == null ? false : interconsulta,
        "isolamento": isolamento == null ? false : isolamento,
        "hcr": hcr == null ? false : hcr,
        "are": are == null ? false : are,
        "protocolos_avc": protocolosAvc == null ? false : protocolosAvc,
        "protocolos_dor_toracica":
            protocolosDorToracica == null ? false : protocolosDorToracica,
        "protocolos_sepse": protocolosSepse == null ? false : protocolosSepse,
        "ucc": ucc == null ? false : ucc,
        "internacao_solicitada":
            internacaoSolicitada == null ? false : internacaoSolicitada,
        "internacao_prescrita":
            internacaoPrescrita == null ? false : internacaoPrescrita,
        "leito_terreo": leitoTerreo == null ? false : leitoTerreo,
        "ecg": ecg == null ? false : ecg,
        "tc": tc == null ? false : tc,
        "rx": rx == null ? false : rx,
        "laboratorial": laboratorial == null ? false : laboratorial,
        "liquor": liquor == null ? false : liquor,
        "usg": usg == null ? false : usg,
        "remocao_solicitada":
            remocaoSolicitada == null ? false : remocaoSolicitada,
        "remocao_encaminhada":
            remocaoEncaminhada == null ? false : remocaoEncaminhada,
        "aguarda_leito": aguardaLeito == null ? false : aguardaLeito,
        "encaminhado_enfermaria":
            encaminhadoEnfermaria == null ? false : encaminhadoEnfermaria,
        "encaminhado_uti": encaminhadoUti == null ? false : encaminhadoUti,
        "encaminhado_centro_cirurgico": encaminhadoCentroCirurgico == null
            ? null
            : encaminhadoCentroCirurgico,
        "alta_medica": altaMedica == null ? false : altaMedica,
        "alta_revelia": altaRevelia == null ? false : altaRevelia,
        "obito": obito == null ? false : obito,
        "evasao": evasao == null ? false : evasao,
        "leito_liberado": leitoLiberado,
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
        codigo: json["codigo"] == null ? false : json["codigo"],
        nome: json["nome"] == null ? false : json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo == null ? false : codigo,
        "nome": nome == null ? false : nome,
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
        data: json["data"] == null ? false : DateTime.parse(json["data"]),
        id: json["_id"] == null ? false : json["_id"],
        crm: json["crm"] == null ? false : json["crm"],
        token: json["token"] == null ? false : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? false : data.toIso8601String(),
        "_id": id == null ? false : id,
        "crm": crm == null ? false : crm,
        "token": token == null ? false : token,
      };
}
