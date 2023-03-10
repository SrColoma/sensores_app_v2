import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sensores_app_v2/models/CamaronGetUsers.dart';

class CamaronGetUsersProvider with ChangeNotifier {
  List<String> columns = ["id","email","user","password","rol"];
  List<List<String>> _rows = [];
  CamaronGetUsers camaronGetUsers = CamaronGetUsers(
    status: 0,
    body: Body(
      items: [],
      count: 0,
      scannedCount: 0,
    ),
  );

  set rows (List<List<String>> rows){
    _rows = rows;
    notifyListeners();
  }

  List<List<String>> get rows => _rows;

  final url = Uri.https('daserldsli.execute-api.us-west-1.amazonaws.com','/camaronGetUsers');

  CamaronGetUsersProvider(){
    getCamaronGetUsers();
  }

  Future<void> getCamaronGetUsers() async {
    final response = await http.get(url);
    try{
      final decodedData = json.decode(response.body);
      final camaronGetUsers = CamaronGetUsers.fromJson(decodedData);
      this.camaronGetUsers = camaronGetUsers;
      _rows = [];
      for (var i = 0; i < camaronGetUsers.body.items.length; i++) {
        _rows.add([
          camaronGetUsers.body.items[i].id,
          camaronGetUsers.body.items[i].email,
          camaronGetUsers.body.items[i].user,
          camaronGetUsers.body.items[i].password,
          camaronGetUsers.body.items[i].rol,
        ]);
      }
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
}