// To parse this JSON data, do
//
//     final camaronAddReporte = camaronAddReporteFromJson(jsonString);

import 'dart:convert';

CamaronAddReporte camaronAddReporteFromJson(String str) => CamaronAddReporte.fromJson(json.decode(str));

String camaronAddReporteToJson(CamaronAddReporte data) => json.encode(data.toJson());

class CamaronAddReporte {
    CamaronAddReporte({
        required this.status,
        required this.body,
    });

    int status;
    Body body;

    factory CamaronAddReporte.fromJson(Map<String, dynamic> json) => CamaronAddReporte(
        status: json["status"],
        body: Body.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "body": body.toJson(),
    };
}

class Body {
    Body({
        required this.id,
        required this.fechaCreacion,
        required this.inicio,
        required this.fin,
        required this.piscina,
    });

    String id;
    DateTime fechaCreacion;
    DateTime inicio;
    DateTime fin;
    String piscina;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        inicio: DateTime.parse(json["inicio"]),
        fin: DateTime.parse(json["fin"]),
        piscina: json["piscina"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "inicio": inicio.toIso8601String(),
        "fin": fin.toIso8601String(),
        "piscina": piscina,
    };
}
