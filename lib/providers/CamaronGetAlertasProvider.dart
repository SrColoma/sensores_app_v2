import 'package:flutter/widgets.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/CamaronGetAlertas.dart';

class CamaronGetAlertasProvider with ChangeNotifier{
  // List<Map<String, String>> _rows = [];
  // List<Map<String, String>> _columns = [];
  List<String> _columns = [];
  List<List<String>> _rows = [];

  CamaronGetAlertas _camaronGetAlertas = CamaronGetAlertas(
    status: 0, 
    body: Body(
      items: [], 
      count: 0, 
      scannedCount: 0
      )
  );

  CamaronGetAlertasProvider(){
    getCamaronGetAlertas();
  }

  List<List<String>> get rows => _rows;
  List<String> get columns => _columns;

  CamaronGetAlertas get camaronGetAlertas => _camaronGetAlertas;

  Future<void> getCamaronGetAlertas() async {
    final url = Uri.https('daserldsli.execute-api.us-west-1.amazonaws.com','/camaronGetAlertas');
    try{
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      final camaronGetAlertas = CamaronGetAlertas.fromJson(decodedData);

      _camaronGetAlertas = camaronGetAlertas;
      _rows = [];
      _columns = [];

      _camaronGetAlertas.body.items.forEach((element) {
        _rows.add([
          element.tipo,
          element.valor,
          element.mensaje,
          element.id,
          element.fecha.toIso8601String(),
        ]);
      });

      _columns = [
        'tipo',
        'valor',
        'mensaje',
        'id',
        'fecha',
      ];
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  set rows(List<List<String>> rows) {
    _rows = rows;
    notifyListeners();
  }

  set columns(List<String> columns) {
    _columns = columns;
    notifyListeners();
  }

  void recargar(){
    notifyListeners();
  }
}