// To parse this JSON data, do
//
//     final camaronGetAllValores = camaronGetAllValoresFromJson(jsonString);

import 'dart:convert';

CamaronGetAllValores camaronGetAllValoresFromJson(String str) => CamaronGetAllValores.fromJson(json.decode(str));

String camaronGetAllValoresToJson(CamaronGetAllValores data) => json.encode(data.toJson());

class CamaronGetAllValores {
    CamaronGetAllValores({
        required this.status,
        required this.body,
    });

    int status;
    Body body;

    factory CamaronGetAllValores.fromJson(Map<String, dynamic> json) => CamaronGetAllValores(
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
        required this.id,
        required this.valores,
        required this.fecha,
    });

    String id;
    Valores valores;
    DateTime fecha;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        valores: Valores.fromJson(json["valores"]),
        fecha: DateTime.parse(json["fecha"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "valores": valores.toJson(),
        "fecha": fecha.toIso8601String(),
    };
}

class Valores {
    Valores({
        required this.tds,
        required this.temp,
        required this.turbidez,
        required this.oxdix,
        required this.ph,
        required this.lluvia,
        required this.sal,
        required this.nivel,
    });

    double tds;
    double temp;
    double turbidez;
    double oxdix;
    double ph;
    double lluvia;
    double sal;
    double nivel;

    factory Valores.fromJson(Map<String, dynamic> json) => Valores(
        tds: json["TDS"]?.toDouble(),
        temp: json["TEMP"]?.toDouble(),
        turbidez: json["TURBIDEZ"]?.toDouble(),
        oxdix: json["OXDIX"]?.toDouble(),
        ph: json["PH"]?.toDouble(),
        lluvia: json["LLUVIA"]?.toDouble(),
        sal: json["SAL"]?.toDouble(),
        nivel: json["NIVEL"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "TDS": tds,
        "TEMP": temp,
        "TURBIDEZ": turbidez,
        "OXDIX": oxdix,
        "PH": ph,
        "LLUVIA": lluvia,
        "SAL": sal,
        "NIVEL": nivel,
    };
}
