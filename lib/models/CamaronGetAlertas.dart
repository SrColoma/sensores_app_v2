// To parse this JSON data, do
//
//     final camaronGetAlertas = camaronGetAlertasFromJson(jsonString);

import 'dart:convert';

CamaronGetAlertas camaronGetAlertasFromJson(String str) => CamaronGetAlertas.fromJson(json.decode(str));

String camaronGetAlertasToJson(CamaronGetAlertas data) => json.encode(data.toJson());

class CamaronGetAlertas {
    CamaronGetAlertas({
        required this.status,
        required this.body,
    });

    int status;
    Body body;

    factory CamaronGetAlertas.fromJson(Map<String, dynamic> json) => CamaronGetAlertas(
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
        required this.tipo,
        required this.valor,
        required this.mensaje,
        required this.id,
        required this.fecha,
    });

    String tipo;
    String valor;
    String mensaje;
    String id;
    DateTime fecha;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        tipo: json["tipo"],
        valor: json["valor"],
        mensaje: json["mensaje"],
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
    );

    Map<String, dynamic> toJson() => {
        "tipo": tipo,
        "valor": valor,
        "mensaje": mensaje,
        "id": id,
        "fecha": fecha.toIso8601String(),
    };
}
