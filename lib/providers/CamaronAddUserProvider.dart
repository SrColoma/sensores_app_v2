import 'dart:convert';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class CamaronAddUserProvider with ChangeNotifier{
  final url = Uri.https('kmf7eub7se.execute-api.us-west-1.amazonaws.com','/camaronAddUser');
  String user = "";
  String password = "";
  String email = "";
  String rol = "user";

  set setUser(String user){
    this.user = user;
    notifyListeners();
  }

  set setPassword(String password){
    this.password = password;
    notifyListeners();
  }

  set setEmail(String email){
    this.email = email;
    notifyListeners();
  }

  set setRol(String rol){
    this.rol = rol;
    notifyListeners();
  }

  Future<void> enviarPeticionAddUser() async {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "user": user,
        "password": password,
        "email": email,
        "rol": rol,
      }),
    );
    notifyListeners();
  }
}