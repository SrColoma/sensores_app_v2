import 'package:flutter/material.dart';


import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class CamaronAddPiscinaProvider with ChangeNotifier{
  final url = Uri.https('kmf7eub7se.execute-api.us-west-1.amazonaws.com','/CamaronAddPiscina');
  String nombre = "";
  String capacidad = "";

  set setNombre(String nombre){
    this.nombre = nombre;
    notifyListeners();
  }

  set setCapacidad(String capacidad){
    this.capacidad = capacidad;
    notifyListeners();
  }

  Future<void> enviarPeticionAddPiscina() async {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "nombre": nombre,
        "capacidad": capacidad,
      }),
    ).then((value){
      notifyListeners();

    });
  }

}