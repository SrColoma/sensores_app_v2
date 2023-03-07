import 'dart:convert';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:sensores_app_v2/models/CamaronSetBoxConfig.dart';
import 'package:sensores_app_v2/models/camaronGetBoxConfig.dart';
import 'package:sensores_app_v2/providers/CamaronGetBoxConfigProvider.dart';


class CamaronSetBoxConfigProvider with ChangeNotifier{

  final url = Uri.https('kmf7eub7se.execute-api.us-west-1.amazonaws.com','/camaronSetBoxConfig');
  Configuracion _configuracion = Configuracion(
        frecuencia:0.0,
        maxLluvia:0.0,
        minNivel:0.0,
        minTemp:0.0,
        minTurbidez:0.0,
        minLluvia:0.0,
        maxTemp:0.0,
        maxNivel:0.0,
        maxOxdix:0.0,
        minOxdix:0.0,
        maxSal:0.0,
        minTds:0.0,
        piscina:"piscina1",
        maxPh:0.0,
        maxTds:0.0,
        minPh:0.0,
        minSal:0.0,
        maxTurbidez:0.0,
  );

  set setConfiguracion(Configuracion configuracion){
    _configuracion = configuracion;
    notifyListeners();
  }

  // CamaronSetBoxConfigProvider(){
  //   enviarPeticionSetBoxConfig();
  // }

  Future<void> enviarPeticionSetBoxConfig() async {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(_configuracion.toJson()),
    ).then((value) => notifyListeners());
  }

}

// {
//   "frecuencia": 2,
//   "piscina": "piscina1",
//   "min_OXDIX" : 1,
//   "max_OXDIX" : 2,
//   "min_TEMP": 4,
//   "max_TEMP": 9,
//   "min_SAL" : 1,
//   "max_SAL" : 3,
//   "min_PH": 2,
//   "max_PH": 4,
//   "min_TURBIDEZ": 1,
//   "max_TURBIDEZ": 2,
//   "min_TDS": 3,
//   "max_TDS": 9,
//   "min_LLUVIA": 0,
//   "max_LLUVIA": 1,
//   "min_NIVEL": 0,
//   "max_NIVEL": 2
// }