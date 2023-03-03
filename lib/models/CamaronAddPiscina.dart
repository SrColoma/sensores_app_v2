// To parse this JSON data, do
//
//     final camaronAddPiscina = camaronAddPiscinaFromJson(jsonString);

import 'dart:convert';

CamaronAddPiscina camaronAddPiscinaFromJson(String str) => CamaronAddPiscina.fromJson(json.decode(str));

String camaronAddPiscinaToJson(CamaronAddPiscina data) => json.encode(data.toJson());

class CamaronAddPiscina {
    CamaronAddPiscina({
        required this.status,
        required this.body,
    });

    int status;
    Body body;

    factory CamaronAddPiscina.fromJson(Map<String, dynamic> json) => CamaronAddPiscina(
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
        required this.fecha,
        required this.nombre,
        required this.capacidad,
    });

    String id;
    DateTime fecha;
    String nombre;
    String capacidad;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        nombre: json["nombre"],
        capacidad: json["capacidad"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": fecha.toIso8601String(),
        "nombre": nombre,
        "capacidad": capacidad,
    };
}
