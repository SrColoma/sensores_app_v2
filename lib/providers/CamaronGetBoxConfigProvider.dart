import 'package:sensores_app_v2/models/camaronGetBoxConfig.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CamaronGetBoxConfigProvider with ChangeNotifier  {
  List<String> columns = ["configuracion","valor"];
  List<List<String>> rows = [];
  final url = Uri.https('kmf7eub7se.execute-api.us-west-1.amazonaws.com','/camaronGetBoxConfig');
  CamaronGetBoxConfig camaronGetBoxConfig = CamaronGetBoxConfig(
    status: 0,
    body: Body(
      frecuencia: 0,
      maxLluvia: 0,
      minNivel: 0,
      minTemp: 0,
      minTurbidez: 0,
      minLluvia: 0,
      maxTemp: 0,
      maxNivel: 0,
      maxOxdix: 0,
      minOxdix: 0,
      maxSal: 0,
      minTds: 0,
      piscina: '',
      maxPh: 0,
      maxTds: 0,
      minPh: 0,
      minSal: 0,
      maxTurbidez: 0,
    )
  );

  

  CamaronGetBoxConfigProvider(){
    getCamaronGetBoxConfig();
  }


  Future<void> getCamaronGetBoxConfig() async {
    final response = await http.get(url);
    try{
      final decodedData = json.decode(response.body);
      final camaronGetBoxConfig = new CamaronGetBoxConfig.fromJson(decodedData);
      this.camaronGetBoxConfig = camaronGetBoxConfig;

      rows = [
        ["Frecuencia",camaronGetBoxConfig.body.frecuencia.toString()],
        ["Maximo de lluvia",camaronGetBoxConfig.body.maxLluvia.toString()],
        ["Minimo de nivel",camaronGetBoxConfig.body.minNivel.toString()],
        ["Minimo de temperatura",camaronGetBoxConfig.body.minTemp.toString()],
        ["Minimo de turbidez",camaronGetBoxConfig.body.minTurbidez.toString()],
        ["Minimo de lluvia",camaronGetBoxConfig.body.minLluvia.toString()],
        ["Maximo de temperatura",camaronGetBoxConfig.body.maxTemp.toString()],
        ["Maximo de nivel",camaronGetBoxConfig.body.maxNivel.toString()],
        ["Maximo de oxido disuelto",camaronGetBoxConfig.body.maxOxdix.toString()],
        ["Minimo de oxido disuelto",camaronGetBoxConfig.body.minOxdix.toString()],
        ["Maximo de salinidad",camaronGetBoxConfig.body.maxSal.toString()],
        ["Minimo de tds",camaronGetBoxConfig.body.minTds.toString()],
        ["Piscina",camaronGetBoxConfig.body.piscina.toString()],
        ["Maximo de ph",camaronGetBoxConfig.body.maxPh.toString()],
        ["Maximo de tds",camaronGetBoxConfig.body.maxTds.toString()],
        ["Minimo de ph",camaronGetBoxConfig.body.minPh.toString()],
        ["Minimo de salinidad",camaronGetBoxConfig.body.minSal.toString()],
        ["Maximo de turbidez",camaronGetBoxConfig.body.maxTurbidez.toString()],
      ];

      notifyListeners();

    }catch(e){
      print("si ves esto es que no se pudo conectar a la api /camaronGetBoxConfig");
      print(e);
    }
  }

  
}


// {
//   "status": 200,
//   "body": {
//     "frecuencia": 2,
//     "max_LLUVIA": 1,
//     "min_NIVEL": 0,
//     "min_TEMP": 4,
//     "min_TURBIDEZ": 1,
//     "min_LLUVIA": 0,
//     "max_TEMP": 9,
//     "max_NIVEL": 2,
//     "max_OXDIX": 2,
//     "min_OXDIX": 1,
//     "max_SAL": 3,
//     "min_TDS": 3,
//     "piscina": "piscina1",
//     "max_PH": 4,
//     "max_TDS": 9,
//     "min_PH": 2,
//     "min_SAL": 1,
//     "max_TURBIDEZ": 2
//   }
// }