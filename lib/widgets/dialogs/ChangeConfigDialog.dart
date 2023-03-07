import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/models/CamaronSetBoxConfig.dart';
import 'package:sensores_app_v2/providers/CamaronGetBoxConfigProvider.dart';
import 'package:sensores_app_v2/providers/CamaronSetBoxConfigProvider.dart';

class ChangeConfigDialog extends StatefulWidget {
  String nombre;
  String valor;
  TextEditingController controller;
  
  ChangeConfigDialog(
    this.controller, 
    this.nombre, 
    this.valor, 
    {super.key}
  );

  @override
  State<ChangeConfigDialog> createState() => _ChangeConfigDialogState();
}

class _ChangeConfigDialogState extends State<ChangeConfigDialog> {
  var _valor = "";

  @override
  Widget build(BuildContext context) {

    final camaronSetBoxConfigProvider = Provider.of<CamaronSetBoxConfigProvider>(context);
    final camaronGetBoxConfigProvider = Provider.of<CamaronGetBoxConfigProvider>(context);


    return CupertinoAlertDialog(
      title: Text('Cambiar el valor de ${widget.nombre}\nDe ${widget.valor} a:'),
      content: Column(
        children: [
          CupertinoTextField(

            // style: TextStyle(color: Colors.white),
            placeholder: 'nuevo valor',
            onChanged: (value) => {
              setState(() {
                _valor = value;
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
          onPressed: _valor != "" ? () {
            Navigator.of(context).pop();
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text('se agregara la piscina\n $_valor'),
                
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
                      // consulta la configuracion de la caja
                      Map<String, dynamic> actualConf = camaronGetBoxConfigProvider.camaronGetBoxConfig.body.toJson();
                      camaronGetBoxConfigProvider.rows = [];
                      // cambia la configuracion de la caja
                      actualConf[widget.nombre] = double.parse(_valor);
                      // envia la nueva configuracion
                      camaronSetBoxConfigProvider.setConfiguracion = Configuracion.fromJson(actualConf);
                      camaronSetBoxConfigProvider.enviarPeticionSetBoxConfig().then((value) {
                        camaronGetBoxConfigProvider.getCamaronGetBoxConfig();

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