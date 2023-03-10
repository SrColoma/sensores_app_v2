import 'package:flutter/foundation.dart';
import 'package:sensores_app_v2/components/gridSensores/Sensor.dart';
import 'package:sensores_app_v2/models/Point.dart';
import 'package:sensores_app_v2/providers/CamaronGetBoxConfigProvider.dart';
import 'dart:convert';
import '../models/CamaronGetAllValores.dart';
import 'package:http/http.dart' as http;

class CamaronGetAllValoresProvider with ChangeNotifier {
  List<String> columns = [];
  List<List<String>> rows = [];

  List<Sensor> _sensores = [
    Sensor(imagen: 'assets/images/TDS.jpg', titulo: 'TDS', media: 'Ppm',minimo: 0,maximo: 0,
      puntos: []
    ),
    Sensor(imagen: 'assets/images/temperatura.jpg', titulo: 'temperatura', media: '°C',minimo: 0,maximo: 0,
      puntos: []
    ),
    Sensor(imagen: 'assets/images/turbidez.jpg', titulo: 'turbidez', media: 'NTU',minimo: 0,maximo: 0,
      puntos: []
    ),
    Sensor(imagen: 'assets/images/PH.jpg', titulo: 'oxdix', media: 'mg/L',minimo: 0,maximo: 0,
      puntos: []
    ),
    Sensor(imagen: 'assets/images/PH.jpg', titulo: 'ph', media: '',minimo: 0,maximo: 0,
      puntos: []
    ),
    Sensor(imagen: 'assets/images/PH.jpg', titulo: 'lluvia', media: '',minimo: 0,maximo: 0,
      puntos: []
    ),
    Sensor(imagen: 'assets/images/PH.jpg', titulo: 'sal', media: '',minimo: 0,maximo: 0,
      puntos: []
    ),
    Sensor(imagen: 'assets/images/PH.jpg', titulo: 'nivel', media: '',minimo: 0,maximo: 0,
      puntos: []
    ),
  ];

  bool isLoading = true;

  CamaronGetAllValores _camaronGetAllValores = CamaronGetAllValores(
    status: 0,
    body: Body(
      items: [], 
      count: 0, 
      scannedCount: 0
    )
  );

  CamaronGetAllValoresProvider() {
    getCamaronGetAllValores();
  }

  CamaronGetAllValores get camaronGetAllValores => _camaronGetAllValores;
  List<Sensor> get sensores => _sensores;

  Future<void> getCamaronGetAllValores() async {
    // final url = Uri.http(dotenv.env['BASE_URL_API']!, '/camaronGetAllValores');
    final url = Uri.https('daserldsli.execute-api.us-west-1.amazonaws.com','/camaronGetAllValores');
    try{
      isLoading = true;

      final resp = await http.get(url);
      _camaronGetAllValores = camaronGetAllValoresFromJson(resp.body);
      columns = _camaronGetAllValores.body.items[0].valores.toJson().keys.toList();
      columns.add("Fecha");


      _sensores.map((sensor) => sensor.puntos =[]);
      rows = _camaronGetAllValores.body.items.map((item) {

        _sensores[0].puntos.add(Point(item.fecha.toIso8601String(), item.valores.tds));
        _sensores[1].puntos.add(Point(item.fecha.toIso8601String(), item.valores.temp));
        _sensores[2].puntos.add(Point(item.fecha.toIso8601String(), item.valores.turbidez));
        _sensores[3].puntos.add(Point(item.fecha.toIso8601String(), item.valores.oxdix));
        _sensores[4].puntos.add(Point(item.fecha.toIso8601String(), item.valores.ph));
        _sensores[5].puntos.add(Point(item.fecha.toIso8601String(), item.valores.lluvia));
        _sensores[6].puntos.add(Point(item.fecha.toIso8601String(), item.valores.sal));
        _sensores[7].puntos.add(Point(item.fecha.toIso8601String(), item.valores.nivel));

        return item.valores.toJson().values.map<String>((value) => value.toString()).toList()..add(item.fecha.toIso8601String());
      }).toList();
      var configprovider = CamaronGetBoxConfigProvider();
      configprovider.getCamaronGetBoxConfig().then((value) =>{
        _sensores[0].minimo = configprovider.getcamaronGetBoxConfig.body.minTds,
        _sensores[0].maximo = configprovider.getcamaronGetBoxConfig.body.maxTds,
        _sensores[1].minimo = configprovider.getcamaronGetBoxConfig.body.minTemp,
        _sensores[1].maximo = configprovider.getcamaronGetBoxConfig.body.maxTemp,
        _sensores[2].minimo = configprovider.getcamaronGetBoxConfig.body.minTurbidez,
        _sensores[2].maximo = configprovider.getcamaronGetBoxConfig.body.maxTurbidez,
        _sensores[3].minimo = configprovider.getcamaronGetBoxConfig.body.minOxdix,
        _sensores[3].maximo = configprovider.getcamaronGetBoxConfig.body.maxOxdix,
        _sensores[4].minimo = configprovider.getcamaronGetBoxConfig.body.minPh,
        _sensores[4].maximo = configprovider.getcamaronGetBoxConfig.body.maxPh,
        _sensores[5].minimo = configprovider.getcamaronGetBoxConfig.body.minLluvia,
        _sensores[5].maximo = configprovider.getcamaronGetBoxConfig.body.maxLluvia,
        _sensores[6].minimo = configprovider.getcamaronGetBoxConfig.body.minSal,
        _sensores[6].maximo = configprovider.getcamaronGetBoxConfig.body.maxSal,
        _sensores[7].minimo = configprovider.getcamaronGetBoxConfig.body.minNivel,
        _sensores[7].maximo = configprovider.getcamaronGetBoxConfig.body.maxNivel,
      });

      isLoading = false;
      notifyListeners();

    }catch(e){
      print("si ves esto es que no se pudo conectar a la api /camaronGetAllValores");
      print(e);
    }
  }

  // fechainicio y fechafinal son strings de fechas en formato iso
  // la variable rows es una lista de listas de strings en el que el element[0] es la fecha
  // en string en formato iso, puedes crear la funcion getRango, que devuelva una lista de listas de strings
  // que contenga los elementos de rows que esten entre fechainicio y fechafinal
  List<List<String>> getRango(String fechainicio, String fechafinal) {
    List<List<String>> resultado = [];

    for (int i = 0; i < rows.length; i++) {
      String fechaActual = rows[i][8];
      if (fechaActual.compareTo(fechainicio) >= 0 && fechaActual.compareTo(fechafinal) <= 0) {
        resultado.add(rows[i]);
      }
    }

    return resultado;
  }


}


//   List<String> columns = ['Nombre', 'Apellido', 'Edad'];
//   List<List<String>> rows = [];

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('https://miapi.com/users'));
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       rows = data.map((user) {
//         return [user['name'], user['surname'], user['age'].toString()];
//       }).toList();
//       notifyListeners();
//     } else {
//       throw Exception('Error al cargar los datos');
//     }
//   }
// }

  // bool isLoading = true;

  // CamaronGetAllValores _camaronGetAllValores = CamaronGetAllValores(
  //   status: 0,
  //   body: Body(
  //     items: [], 
  //     count: 0, 
  //     scannedCount: 0
  //   )
  // );

  // CamaronGetAllValores get camaronGetAllValores => _camaronGetAllValores;

  // Future<void> getCamaronGetAllValores() async {
  //   // final url = Uri.http(dotenv.env['BASE_URL_API']!, '/camaronGetAllValores');
  //   final url = Uri.https('kmf7eub7se.execute-api.us-west-1.amazonaws.com','/camaronGetAllValores');
  //   try{
  //     final resp = await http.get(url);
  //     _camaronGetAllValores = camaronGetAllValoresFromJson(resp.body);
  //     isLoading = false;
  //     notifyListeners();

  //   }catch(e){
  //     print("si ves esto es que no se pudo conectar a la api");
  //     print(e);
  //   }
  // }
// }

// res.body.items.forEach((element) {
//   print(element.valores);
//   print(element.fecha);
//   print(element.id);
//   valores.forEach((key, value) {
//     print(key);
//     print(value);
//   });
// });
// {
//   "status": 200,
//   "body": {
//     "Items": [
//       {
//         "id": "2429edf5-fe54-4d0f-b239-d0258aed0202",
//         "valores": {
//           "TDS": 4,
//           "TEMP": 5,
//           "TURBIDEZ": 2,
//           "OXDIX": 6,
//           "PH": 4,
//           "LLUVIA": 0,
//           "SAL": 3,
//           "NIVEL": 1
//         },
//         "fecha": "2023-02-17T09:38:24.643Z"
//       },
//       {
//         "id": "e375c435-b5d9-4df9-8a00-ef98caf6ece7",
//         "valores": {
//           "TDS": 5,
//           "TEMP": 3,
//           "TURBIDEZ": 1,
//           "OXDIX": 7,
//           "PH": 2,
//           "LLUVIA": 0,
//           "SAL": 4,
//           "NIVEL": 1
//         },
//         "fecha": "2023-02-17T09:37:58.338Z"
//       },
//       {
//         "id": "1ba9a491-17f5-44e3-b80e-8725e7dc0f31",
//         "valores": {
//           "TDS": 9,
//           "TEMP": 9,
//           "TURBIDEZ": 2,
//           "OXDIX": 2,
//           "PH": 4,
//           "LLUVIA": 0,
//           "SAL": 3,
//           "NIVEL": 1
//         },
//         "fecha": "2023-02-17T09:37:40.239Z"
//       },
//       {
//         "id": "7490be01-7c62-4d64-a5d0-285c2e5ec1ba",
//         "valores": {
//           "TDS": 2,
//           "TEMP": 3,
//           "TURBIDEZ": 5,
//           "OXDIX": 1,
//           "PH": 4,
//           "LLUVIA": 0,
//           "SAL": 3,
//           "NIVEL": 1
//         },
//         "fecha": "2023-02-17T09:38:11.975Z"
//       },
//       {
//         "id": "24f0a5b2-5c3b-4305-bba9-ef8a2af76fac",
//         "valores": {
//           "TDS": 6,
//           "TEMP": 4,
//           "TURBIDEZ": 2,
//           "OXDIX": 6,
//           "PH": 3,
//           "LLUVIA": 0,
//           "SAL": 4,
//           "NIVEL": 1
//         },
//         "fecha": "2023-02-23T12:43:27.015Z"
//       }
//     ],
//     "Count": 5,
//     "ScannedCount": 5
//   }
// }