import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/providers/CamaronAddPiscinaProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetPiscinasProvider.dart';

class NuevaPiscinaDialog extends StatefulWidget {

  const NuevaPiscinaDialog({super.key});

  @override
  State<NuevaPiscinaDialog> createState() => _NuevaPiscinaDialogState();
}

class _NuevaPiscinaDialogState extends State<NuevaPiscinaDialog> {
  var _nombre = "";
  var _capacidad = "";

  @override
  Widget build(BuildContext context) {

    final camaronAddPiscinaProvider = Provider.of<CamaronAddPiscinaProvider>(context);
    final camaronGetPiscinasProvider = Provider.of<CamaronGetPiscinasProvider>(context);

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
            onChanged: (value) => {
              setState(() {
                _capacidad = value;
              }),
            }
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
                      //TODO: aqui comienza a crearse un nuevo censo
                      camaronGetPiscinasProvider.rows = [];
                      camaronGetPiscinasProvider.piscinas = [];
                      camaronAddPiscinaProvider.nombre = _nombre;
                      camaronAddPiscinaProvider.capacidad = _capacidad;
                      camaronAddPiscinaProvider.enviarPeticionAddPiscina().then((value) => {
                        camaronGetPiscinasProvider.getCamaronGetPiscinas()
                      });
                      Navigator.of(context).pop();

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