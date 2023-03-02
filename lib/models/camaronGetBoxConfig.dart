// To parse this JSON data, do
//
//     final camaronGetBoxConfig = camaronGetBoxConfigFromJson(jsonString);

import 'dart:convert';

CamaronGetBoxConfig camaronGetBoxConfigFromJson(String str) => CamaronGetBoxConfig.fromJson(json.decode(str));

String camaronGetBoxConfigToJson(CamaronGetBoxConfig data) => json.encode(data.toJson());

class CamaronGetBoxConfig {
    CamaronGetBoxConfig({
        required this.status,
        required this.body,
    });

    int status;
    Body body;

    factory CamaronGetBoxConfig.fromJson(Map<String, dynamic> json) => CamaronGetBoxConfig(
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

    double frecuencia;
    double maxLluvia;
    double minNivel;
    double minTemp;
    double minTurbidez;
    double minLluvia;
    double maxTemp;
    double maxNivel;
    double maxOxdix;
    double minOxdix;
    double maxSal;
    double minTds;
    String piscina;
    double maxPh;
    double maxTds;
    double minPh;
    double minSal;
    double maxTurbidez;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        frecuencia: json["frecuencia"]?.toDouble(),
        maxLluvia: json["max_LLUVIA"]?.toDouble(),
        minNivel: json["min_NIVEL"]?.toDouble(),
        minTemp: json["min_TEMP"]?.toDouble(),
        minTurbidez: json["min_TURBIDEZ"]?.toDouble(),
        minLluvia: json["min_LLUVIA"]?.toDouble(),
        maxTemp: json["max_TEMP"]?.toDouble(),
        maxNivel: json["max_NIVEL"]?.toDouble(),
        maxOxdix: json["max_OXDIX"]?.toDouble(),
        minOxdix: json["min_OXDIX"]?.toDouble(),
        maxSal: json["max_SAL"]?.toDouble(),
        minTds: json["min_TDS"]?.toDouble(),
        piscina: json["piscina"],
        maxPh: json["max_PH"]?.toDouble(),
        maxTds: json["max_TDS"]?.toDouble(),
        minPh: json["min_PH"]?.toDouble(),
        minSal: json["min_SAL"]?.toDouble(),
        maxTurbidez: json["max_TURBIDEZ"]?.toDouble(),
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
