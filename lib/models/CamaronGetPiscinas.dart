// To parse this JSON data, do
//
//     final camaronGetPiscinas = camaronGetPiscinasFromJson(jsonString);

import 'dart:convert';

CamaronGetPiscinas camaronGetPiscinasFromJson(String str) => CamaronGetPiscinas.fromJson(json.decode(str));

String camaronGetPiscinasToJson(CamaronGetPiscinas data) => json.encode(data.toJson());

class CamaronGetPiscinas {
    CamaronGetPiscinas({
        required this.status,
        required this.body,
    });

    int status;
    Body body;

    factory CamaronGetPiscinas.fromJson(Map<String, dynamic> json) => CamaronGetPiscinas(
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
        required this.items,
        required this.count,
        required this.scannedCount,
    });

    List<Item> items;
    int count;
    int scannedCount;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
        count: json["Count"],
        scannedCount: json["ScannedCount"],
    );

    Map<String, dynamic> toJson() => {
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
        "Count": count,
        "ScannedCount": scannedCount,
    };
}

class Item {
    Item({
        required this.nombre,
        required this.id,
        required this.fecha,
        required this.capacidad,
    });

    String nombre;
    String id;
    DateTime fecha;
    String capacidad;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        nombre: json["nombre"],
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        capacidad: json["capacidad"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "id": id,
        "fecha": fecha.toIso8601String(),
        "capacidad": capacidad,
    };
}
