import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sensores_app_v2/pages/SensoresPage.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevaPiscinaDialog.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevoCensoDialog.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevoReporteDialog.dart';

import '../widgets/dialogs/NuevoFrecuenciaDialog.dart';

  // NuevoFrecuenciaDialog nuevoFrecuenciaDialog = NuevoFrecuenciaDialog();
  // NuevaPiscinaDialog nuevaPiscinaDialog = NuevaPiscinaDialog();
  // NuevoCensoDialog nuevoCensoDialog = NuevoCensoDialog();
  // NuevoReporteDialog nuevoReporteDialog = NuevoReporteDialog();
class PageProvider with ChangeNotifier {

  dynamic _dialogoSeleccionado = CupertinoAlertDialog();

  late String _routeName = 'ruta';
  late String _title = 'titulo';
  late String _buttonString = "boton";
  

  dynamic get dialogoSeleccionado => _dialogoSeleccionado;

  String get routeName => _routeName;
  String get title => _title;
  String get buttonString => _buttonString;


  set dialogoSeleccionado(dynamic dialogo) {
    _dialogoSeleccionado = dialogo;
    // notifyListeners();
  }

  set routeName(String routeName) {
    _routeName = routeName;
    // notifyListeners();
  }

  set title(String title) {
    _title = title;
    // notifyListeners();
  }

  set buttonString(String buttonString) {
    _buttonString = buttonString;
    // notifyListeners();
  }

  void recargar(){
    notifyListeners();
  }



}