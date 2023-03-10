import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/providers/CamaronGetPiscinasProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetReportesProvider.dart';
import 'package:sensores_app_v2/providers/SessionProvider.dart';
import 'package:intl/intl.dart';

class NuevoReporteDialog extends StatefulWidget {
  const NuevoReporteDialog({super.key});

  @override
  State<NuevoReporteDialog> createState() => _NuevoReporteDialogState();
}

class _NuevoReporteDialogState extends State<NuevoReporteDialog> {
  DateTime _dateInicio = DateTime.now();
  DateTime _dateFin = DateTime.now();
  // var _piscinaList = ['Piscina 1', 'Piscina 2', 'Piscina 3'];
  // var _selectedPiscina = 'Piscina 1';
  var _selectedPiscina = "";
  
  @override
  Widget build(BuildContext context) {

    final camaronGetPiscinasProvider = Provider.of<CamaronGetPiscinasProvider>(context);
    final camaronGetReportesProvider = Provider.of<CamaronGetReportesProvider>(context);
    final sessionProvider = Provider.of<SessionProvider>(context);
    var _piscinaList = camaronGetPiscinasProvider.piscinas;
    _selectedPiscina = _piscinaList[0];


    return CupertinoAlertDialog(
      title: Text('Nuevo Reporte'),
      insetAnimationCurve: Curves.easeInOut,
      insetAnimationDuration: Duration(milliseconds: 500),
      content: Column(
        children: [
          CupertinoButton(
            child: Text('Piscina: $_selectedPiscina'),
            onPressed: () {
              showCupertinoModalPopup(
                context: context, 
                builder: (context)=> Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (value) {
                        _selectedPiscina = _piscinaList[value];
                      setState(() {
                      });
                    },
                    children: _piscinaList.map((e) => Text(e)).toList(),
                  ),
                ),
              );
            },
          ),
          CupertinoButton(
            
            child: Text('Desde: ${_dateInicio.day}/${_dateInicio.month}/${_dateInicio.year}'),
            onPressed: //cupertino time picker
              (
                () => showCupertinoModalPopup(
                  context: context,
                  builder: (context) => Container(
                    color: Colors.white,
                    // height: Screen.height(context) * 0.5,
                    
                    height: MediaQuery.of(context).size.height * 0.5,
                    // height: 500,
                    // child: CupertinoTimerPicker(
                    //   minuteInterval: 12,
                    //   mode: CupertinoTimerPickerMode.,
                    //   initialTimerDuration: _dateInicio,
                    //   onTimerDurationChanged: (value) {
                    //     setState(() {
                    //       _dateInicio = value;
                    //     });
                    //   },
                    // ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: _dateInicio,
                      onDateTimeChanged: (value) {
                        setState(() {
                          _dateInicio = value;
                        });
                      },
                    ),
                  ),
                )
              ),
          ),

          CupertinoButton(
            child: Text('Hasta: ${_dateFin.day}/${_dateFin.month}/${_dateFin.year}'),
            onPressed: //cupertino time picker
              (
                () => showCupertinoModalPopup(
                  context: context,
                  builder: (context) => Container(
                    color: Colors.white,
                    // height: Screen.height(context) * 0.5,
                    height: MediaQuery.of(context).size.height * 0.5,
                    // height: 500,
                    // chil
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: _dateFin,
                      onDateTimeChanged: (value) {
                        setState(() {
                          _dateFin = value;
                        });
                      },
                    ),
                  ),
                )
              ),
          ),

        ],
      ),
      actions: [
        CupertinoDialogAction(
          child: Text('Cancelar', style: TextStyle(color: Colors.red),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        CupertinoDialogAction(
          child: Text('Crear Reporte'),
          onPressed:  
          //si la fecha de fin es menor a la fecha actual 
          //y la fecha de inicio es menor a la fecha de fin
          (
            _dateFin.isBefore(DateTime.now()) 
            && _dateInicio.isBefore(_dateFin)
          ) ? () {
            Navigator.of(context).pop();
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text('¿Desea obtener el reporte?'),
                content: Column(
                  children: [
                    // Text('Desde: ${_dateInicio.day}'),
                    // Text('Hasta: ${_dateFin.day}'),
                    //texto que muestre la fecha de inicio y la fecha de fin
                    Text('Desde: ${_dateInicio.day}/${_dateInicio.month}/${_dateInicio.year}'),
                    Text('Hasta: ${_dateFin.day}/${_dateFin.month}/${_dateFin.year}'),
                  ],
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text('Cancelar', style: TextStyle(color: Colors.red),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('Aceptar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      //TODO: aqui comienza a adquirir un nuevo reporte
                      camaronGetReportesProvider.rows = [];
                      camaronGetReportesProvider.addReporte(
                        DateFormat('yyyy-MM-dd').format(_dateInicio),
                        DateFormat('yyyy-MM-dd').format(_dateFin),
                        _selectedPiscina
                      ).then((value){
                        camaronGetReportesProvider.getCamaronGetReportes();
                      });
                    },
                  ),
                ],
              ),
            );
          } : null,
        ),
      ],
    );
  }
}