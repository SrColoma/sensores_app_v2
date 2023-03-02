import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/providers/CamaronAddUserProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetUsersProvider.dart';

class NuevoUserDialog extends StatefulWidget {

  const NuevoUserDialog({super.key});

  @override
  State<NuevoUserDialog> createState() => _NuevoUserDialogState();
}

class _NuevoUserDialogState extends State<NuevoUserDialog> {
  var _usuario = "";
  var _contrasenia = "";
  var _rol = "admin";

  @override
  Widget build(BuildContext context) {

    final camaronAddUserProvider = Provider.of<CamaronAddUserProvider>(context);
    final camaronGetUsersProvider = Provider.of<CamaronGetUsersProvider>(context);

    return CupertinoAlertDialog(
      title: const Text('Nuevo Usuario\n'),
      content: Column(
        children: [
          CupertinoTextField(

            // style: TextStyle(color: Colors.white),
            placeholder: 'Usuario',
            onChanged: (value) => {
              setState(() {
                _usuario = value;
              }),
            }
          ),

          CupertinoTextField(

            // style: TextStyle(color: Colors.white),
            placeholder: 'Constrasenia',
            onChanged: (value) => {
              setState(() {
                _contrasenia = value;
              }),
            }
          ),

          CupertinoButton(
            child: Text(_rol),
            onPressed: () {
              showCupertinoModalPopup(
                context: context, 
                builder: (context) => CupertinoActionSheet(
                  title: Text('Selecciona un rol'),
                  actions: [
                    CupertinoActionSheetAction(
                      child: Text('Administrador'),
                      onPressed: () {
                        _rol = "admin";
                        Navigator.of(context).pop();
                        setState(() {
                          
                        });
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text('Usuario'),
                      onPressed: () {
                        _rol = "user";
                        Navigator.of(context).pop();
                        setState(() {
                          
                        });
                      },
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              );
            },
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
          onPressed: _usuario != "" ? () {
            Navigator.of(context).pop();
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text('se agregara al usuario\n $_usuario'),
                
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
                      camaronAddUserProvider.user = _usuario;
                      camaronAddUserProvider.password = _contrasenia;
                      camaronAddUserProvider.rol = _rol;
                      camaronAddUserProvider.enviarPeticionAddUser();
                      camaronGetUsersProvider.getCamaronGetUsers();

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