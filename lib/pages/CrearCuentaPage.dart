import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/providers/CamaronAddUserProvider.dart';

import '../components/TopBarSliver.dart';
import '../providers/PageProvider.dart';

class CrearCuentaPage extends StatelessWidget {
  static const routeName = 'CrearCuentaPage';
  static const title = 'Crear Cuenta';
  static const buttonString = "";
  const CrearCuentaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context);
    final camaronAddUserProvider = Provider.of<CamaronAddUserProvider>(context);

    pageProvider.routeName = routeName;
    pageProvider.title = title;
    pageProvider.buttonString = buttonString;
    // pageProvider.dialogoSeleccionado = funcionNuevaFrecuencia;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TopBarSliver(
            showActions: false,
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    // key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CupertinoButton(
                          child: Text(camaronAddUserProvider.rol),
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoActionSheet(
                                actions: [

                                  CupertinoActionSheetAction(
                                    child: Text('Administrador'),
                                    onPressed: () {
                                      camaronAddUserProvider.setRol = "admin";
                                      Navigator.pop(context);
                                    },
                                  ),
                                  
                                  CupertinoActionSheetAction(
                                    child: Text('Usuario'),
                                    onPressed: () {
                                      camaronAddUserProvider.setRol = "user";
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                  child: Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 10),


                        CupertinoTextField(
                          placeholder: 'Correo electrónico',
                          onChanged: (value) => {
                            camaronAddUserProvider.setEmail = value,
                          }
                        ),

                        SizedBox(height: 10),


                        CupertinoTextField(
                          placeholder: 'Nombre de usuario',
                          onChanged: (value) => {
                            camaronAddUserProvider.setUser = value,
                          }
                        ),

                        SizedBox(height: 10),


                        CupertinoTextField(
                          placeholder: 'Contraseña',
                          onChanged: (value) => {
                            camaronAddUserProvider.setPassword = value,
                          }
                        ),

                        SizedBox(height: 10),


                        // CupertinoTextField(
                        //   placeholder: 'Repetir contraseña',
                        // ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: CupertinoButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                  title: Text('Crear cuenta'),
                                  content: Text('¿Estás seguro de crear la cuenta: ${camaronAddUserProvider.user}'),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      child: Text('Crear'),
                                      onPressed: () {
                                        // espera a que se envie la peticion y hace pop
                                        // camaronAddUserProvider.enviarPeticionAddUser().then((value){
                                        //   Navigator.pop(context);

                                        // });
                                        camaronAddUserProvider.enviarPeticionAddUser();
                                        Navigator.pop(context);

                                      },
                                    ),
                                  ],
                                ),
                              );
                              // if (_formKey.currentState.validate()) {
                              //   _formKey.currentState.save();
                              //   // Aquí puedes enviar los datos de registro al servidor
                              // }
                            },
                            child: Text('Crear cuenta'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}