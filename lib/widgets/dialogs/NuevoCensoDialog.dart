import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NuevoCensoDialog extends StatefulWidget {
  const NuevoCensoDialog({super.key});

  @override
  State<NuevoCensoDialog> createState() => _NuevoCensoDialogState();
}

class _NuevoCensoDialogState extends State<NuevoCensoDialog> {
  static const ceroDuration = Duration(hours: 0, minutes: 0, seconds: 0);
  var _selectedTime = ceroDuration;
  var _selectedFrequency = ceroDuration;
  
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Nuevo Censo'),
      insetAnimationCurve: Curves.easeInOut,
      insetAnimationDuration: Duration(milliseconds: 500),
      content: Column(
        children: [
          CupertinoButton(
            
            child: Text('Durante: ${_selectedTime.inHours}h ${(_selectedTime.inMinutes % 60).round()}min'),
            onPressed: //cupertino time picker
              (
                () => showCupertinoModalPopup(
                  context: context,
                  builder: (context) => Container(
                    // height: Screen.height(context) * 0.5,
                    
                    height: MediaQuery.of(context).size.height * 0.5,
                    // height: 500,
                    child: CupertinoTimerPicker(
                      minuteInterval: 12,
                      mode: CupertinoTimerPickerMode.hm,
                      initialTimerDuration: _selectedTime,
                      onTimerDurationChanged: (value) {
                        setState(() {
                          _selectedTime = value;
                        });
                      },
                    ),
                  ),
                )
              ),
          ),

          CupertinoButton(
            child: Text('Cada: ${_selectedFrequency.inHours}h ${(_selectedFrequency.inMinutes % 60).round()}min'),
            onPressed: //cupertino time picker
              (
                () => showCupertinoModalPopup(
                  context: context,
                  builder: (context) => Container(
                    // height: Screen.height(context) * 0.5,
                    height: MediaQuery.of(context).size.height * 0.5,
                    // height: 500,
                    child: CupertinoTimerPicker(
                      minuteInterval: 2,

                      mode: CupertinoTimerPickerMode.hm,
                      initialTimerDuration: _selectedFrequency,
                      onTimerDurationChanged: (value) {
                        setState(() {
                          _selectedFrequency = value;
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
          child: Text('Censar'),
          onPressed: _selectedTime > ceroDuration && _selectedFrequency>ceroDuration ? () {
            Navigator.of(context).pop();
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text('¿Desea iniciar el censo?'),
                content: Column(
                  children: [
                    Text('Durante: ${_selectedTime.inHours}h ${(_selectedTime.inMinutes % 60).round()}min'),
                    Text('Cada: ${_selectedFrequency.inHours}h ${(_selectedFrequency.inMinutes % 60).round()}min'),
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
                      //TODO: aqui comienza a crearse un nuevo censo
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