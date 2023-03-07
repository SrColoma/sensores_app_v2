import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:sensores_app_v2/models/CamaronGetReportes.dart';

class CamaronGetReportesProvider with ChangeNotifier {
  List<String> _columns = ["id","piscina","inicio","fin"];
  List<List<String>> _rows = [];
  CamaronGetReportes camaronGetReportes = CamaronGetReportes(
    status: 0,
    body: Body(
      items: [],
      count: 0,
      scannedCount: 0,
    ),
  );

  List<String> get columns => _columns;
  List<List<String>> get rows => _rows;

  set rows(List<List<String>> value) {
    _rows = value;
  }

  set columns(List<String> value) {
    _columns = value;
  }

  final url = Uri.https('kmf7eub7se.execute-api.us-west-1.amazonaws.com','/camaronGetReportes');

  CamaronGetReportesProvider(){
    getCamaronGetReportes();
  }

  Future<void> getCamaronGetReportes() async {
    final response = await http.get(url);
    try{
      final decodedData = json.decode(response.body);
      final camaronGetReportes = CamaronGetReportes.fromJson(decodedData);
      this.camaronGetReportes = camaronGetReportes;
      rows = [];
      for (var i = 0; i < camaronGetReportes.body.items.length; i++) {
        rows.add([
          camaronGetReportes.body.items[i].id,
          camaronGetReportes.body.items[i].piscina,
          camaronGetReportes.body.items[i].inicio.toIso8601String(),
          camaronGetReportes.body.items[i].fin.toIso8601String(),
        ]);
      }
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  Future<void> addReporte(String inicio,String fin,String piscina){
    final url = Uri.https('kmf7eub7se.execute-api.us-west-1.amazonaws.com','/camaronAddReporte');
    final body = json.encode({"inicio":inicio,"fin":fin,"piscina":piscina});
    // final body = json.encode({"id":id});
    final headers = {'Content-Type': 'application/json'};
    return http.post(url, body: body, headers: headers).then((response){
      _rows = [];
      notifyListeners();
      // getCamaronGetReportes();
    });
  }
}
// {
//      "inicio": "2022-04-01T00:00:00.000Z",
//      "fin": "2022-05-01T00:00:00.000Z",
//      "piscina": "piscina1"
// }