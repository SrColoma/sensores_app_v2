// To parse this JSON data, do
//
//     final camaronSetBoxConfig = camaronSetBoxConfigFromJson(jsonString);

import 'dart:convert';

CamaronSetBoxConfig camaronSetBoxConfigFromJson(String str) => CamaronSetBoxConfig.fromJson(json.decode(str));

String camaronSetBoxConfigToJson(CamaronSetBoxConfig data) => json.encode(data.toJson());

class CamaronSetBoxConfig {
    CamaronSetBoxConfig({
        required this.status,
        required this.body,
    });

    int status;
    Body body;

    factory CamaronSetBoxConfig.fromJson(Map<String, dynamic> json) => CamaronSetBoxConfig(
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
        required this.attributes,
    });

    Attributes attributes;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        attributes: Attributes.fromJson(json["Attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "Attributes": attributes.toJson(),
    };
}

class Attributes {
    Attributes({
        required this.fecha,
        required this.configuracion,
    });

    DateTime fecha;
    Configuracion configuracion;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        fecha: DateTime.parse(json["fecha"]),
        configuracion: Configuracion.fromJson(json["configuracion"]),
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha.toIso8601String(),
        "configuracion": configuracion.toJson(),
    };
}

class Configuracion {
    Configuracion({
        required this.frecuencia,
        required this.maxLluvia,
        required this.minNivel,
        required this.minTemp,
        required this.minTurbidez,
        required this.minLluvia,
        required this.maxTemp,
        required this.maxNivel,
        required this.maxOxdix,
        required this.minOxdix,
        required this.maxSal,
        required this.minTds,
        required this.piscina,
        required this.maxPh,
        required this.maxTds,
        required this.minPh,
        required this.minSal,
        required this.maxTurbidez,
    });

    int frecuencia;
    int maxLluvia;
    int minNivel;
    int minTemp;
    int minTurbidez;
    int minLluvia;
    int maxTemp;
    int maxNivel;
    int maxOxdix;
    int minOxdix;
    int maxSal;
    int minTds;
    String piscina;
    int maxPh;
    int maxTds;
    int minPh;
    int minSal;
    int maxTurbidez;

    factory Configuracion.fromJson(Map<String, dynamic> json) => Configuracion(
        frecuencia: json["frecuencia"],
        maxLluvia: json["max_LLUVIA"],
        minNivel: json["min_NIVEL"],
        minTemp: json["min_TEMP"],
        minTurbidez: json["min_TURBIDEZ"],
        minLluvia: json["min_LLUVIA"],
        maxTemp: json["max_TEMP"],
        maxNivel: json["max_NIVEL"],
        maxOxdix: json["max_OXDIX"],
        minOxdix: json["min_OXDIX"],
        maxSal: json["max_SAL"],
        minTds: json["min_TDS"],
        piscina: json["piscina"],
        maxPh: json["max_PH"],
        maxTds: json["max_TDS"],
        minPh: json["min_PH"],
        minSal: json["min_SAL"],
        maxTurbidez: json["max_TURBIDEZ"],
    );

    Map<String, dynamic> toJson() => {
        "frecuencia": frecuencia,
        "max_LLUVIA": maxLluvia,
        "min_NIVEL": minNivel,
        "min_TEMP": minTemp,
        "min_TURBIDEZ": minTurbidez,
        "min_LLUVIA": minLluvia,
        "max_TEMP": maxTemp,
        "max_NIVEL": maxNivel,
        "max_OXDIX": maxOxdix,
        "min_OXDIX": minOxdix,
        "max_SAL": maxSal,
        "min_TDS": minTds,
        "piscina": piscina,
        "max_PH": maxPh,
        "max_TDS": maxTds,
        "min_PH": minPh,
        "min_SAL": minSal,
        "max_TURBIDEZ": maxTurbidez,
    };
}
