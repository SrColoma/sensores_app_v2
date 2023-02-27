import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NuevaPiscinaDialog extends StatefulWidget {

  const NuevaPiscinaDialog({super.key});

  @override
  State<NuevaPiscinaDialog> createState() => _NuevaPiscinaDialogState();
}

class _NuevaPiscinaDialogState extends State<NuevaPiscinaDialog> {
  var _nombre = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Nueva Piscina\n'),
      content: Column(
        children: [
          CupertinoTextField(

            // style: TextStyle(color: Colors.white),
            placeholder: 'Nombre de la piscina',
            onChanged: (value) => {
              setState(() {
                _nombre = value;
              }),
            }
          ),

          CupertinoTextField(

            // style: TextStyle(color: Colors.white),
            placeholder: 'Capacidad',
            // onChanged: (value) => {
            //   setState(() {
            //     _nombre = value;
            //   }),
            // }
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          child: const Text('Cancelar'),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: const Text('Agregar'),
          onPressed: _nombre != "" ? () {
            Navigator.of(context).pop();
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text('se agregara la piscina\n $_nombre'),
                
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
          }:null,
        ),
      ],
    );
  }
}