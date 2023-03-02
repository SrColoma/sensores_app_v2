import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sensores_app_v2/components/gridSensores/Sensor.dart';


class SessionProvider with ChangeNotifier {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<String> _piscinas = ['Piscina1', 'Piscina2', 'Piscina3', 'Piscina4', 'Piscina5', 'Piscina6'];
  // List<Sensor> _sensores = [
  //   Sensor(imagen: 'assets/images/turbidez.jpg', titulo: 'temperatura', media: '1',puntos: []),
  //   Sensor(imagen: 'assets/images/temperatura.jpg', titulo: 'temperatura', media: '1',puntos: []),
  //   Sensor(imagen: 'assets/images/TDS.jpg', titulo: 'temperatura', media: '1',puntos: []),
  //   Sensor(imagen: 'assets/images/PH.jpg', titulo: 'temperatura', media: '1',puntos: []),
  // ];

  String _user = 'Default';
  String _rol = 'user';
  String _piscina = 'Default';
  String _mensaje = '';
  bool canUsed = false;

  String get user => _user;
  String get rol => _rol;
  String get piscina => _piscina;
  String get mensaje => _mensaje;

  // List<Sensor> get sensores => _sensores;
  List<String> get piscinas => _piscinas;

  set user(String user) {
    _user = user;
    notifyListeners();
  }

  set rol(String rol) {
    _rol = rol;
    canUsed = _rol == 'admin' ? true : false;
    notifyListeners();
  }

  set piscina(String piscina) {
    _piscina = piscina;
    notifyListeners();
  }

  set mensaje(String mensaje) {
    _mensaje = mensaje;
    notifyListeners();
  }

  void recargar(){
    notifyListeners();
  }

  

  
}