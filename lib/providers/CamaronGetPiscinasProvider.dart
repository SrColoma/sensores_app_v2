import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sensores_app_v2/models/CamaronGetPiscinas.dart';

class CamaronGetPiscinasProvider with ChangeNotifier{
  List<String> columns = ["id","nombre","fecha","capacidad"];
  List<List<String>> rows = [];
  List<String> piscinas = [];

  CamaronGetPiscinas camaronGetPiscinas = CamaronGetPiscinas(
    status: 0,
    body: Body(
      items: [],
      count: 0,
      scannedCount: 0,
    ),
  );

  final url = Uri.https('kmf7eub7se.execute-api.us-west-1.amazonaws.com','/camaronGetPiscinas');

  CamaronGetPiscinasProvider(){
    getCamaronGetPiscinas();
  }

  Future<void> getCamaronGetPiscinas() async {
    final response = await http.get(url);
    try{
      final decodedData = json.decode(response.body);
      final camaronGetPiscinas = CamaronGetPiscinas.fromJson(decodedData);
      this.camaronGetPiscinas = camaronGetPiscinas;
      rows = [];
      for (var i = 0; i < camaronGetPiscinas.body.items.length; i++) {
        rows.add([
          camaronGetPiscinas.body.items[i].id,
          camaronGetPiscinas.body.items[i].nombre,
          camaronGetPiscinas.body.items[i].fecha.toIso8601String(),
          camaronGetPiscinas.body.items[i].capacidad.toString(),
        ]);
        piscinas.add(camaronGetPiscinas.body.items[i].nombre);
      }
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
}


// import 'package:sensores_app_v2/models/CamaronGetReportes.dart';

// class CamaronGetPiscinasProvider with ChangeNotifier {
//   List<String> columns = ["id","piscina","inicio","fin"];
//   List<List<String>> rows = [];
//   CamaronGetReportes camaronGetReportes = CamaronGetReportes(
//     status: 0,
//     body: Body(
//       items: [],
//       count: 0,
//       scannedCount: 0,
//     ),
//   );

//   final url = Uri.https('kmf7eub7se.execute-api.us-west-1.amazonaws.com','/camaronGetReportes');

//   CamaronGetPiscinasProvider(){
//     getCamaronGetReportes();
//   }

//   Future<void> getCamaronGetReportes() async {
//     final response = await http.get(url);
//     try{
//       final decodedData = json.decode(response.body);
//       final camaronGetReportes = CamaronGetReportes.fromJson(decodedData);
//       this.camaronGetReportes = camaronGetReportes;
//       rows = [];
//       for (var i = 0; i < camaronGetReportes.body.items.length; i++) {
//         rows.add([
//           camaronGetReportes.body.items[i].id,
//           camaronGetReportes.body.items[i].piscina,
//           camaronGetReportes.body.items[i].inicio.toIso8601String(),
//           camaronGetReportes.body.items[i].fin.toIso8601String(),
//         ]);
//       }
//       notifyListeners();
//     }catch(e){
//       print(e);
//     }
//   }
// }