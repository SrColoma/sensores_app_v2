// To parse this JSON data, do
//
//     final camaronGetReportes = camaronGetReportesFromJson(jsonString);

import 'dart:convert';

CamaronGetReportes camaronGetReportesFromJson(String str) => CamaronGetReportes.fromJson(json.decode(str));

String camaronGetReportesToJson(CamaronGetReportes data) => json.encode(data.toJson());

class CamaronGetReportes {
    CamaronGetReportes({
        required this.status,
        required this.body,
    });

    int status;
    Body body;

    factory CamaronGetReportes.fromJson(Map<String, dynamic> json) => CamaronGetReportes(
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
        required this.fin,
        required this.piscina,
        required this.inicio,
        required this.id,
        required this.fechaCreacion,
    });

    DateTime fin;
    String piscina;
    DateTime inicio;
    String id;
    DateTime fechaCreacion;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        fin: DateTime.parse(json["fin"]),
        piscina: json["piscina"],
        inicio: DateTime.parse(json["inicio"]),
        id: json["id"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
    );

    Map<String, dynamic> toJson() => {
        "fin": fin.toIso8601String(),
        "piscina": piscina,
        "inicio": inicio.toIso8601String(),
        "id": id,
        "fechaCreacion": fechaCreacion.toIso8601String(),
    };
}
