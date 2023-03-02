import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                          child: Text('Tipo de usuario'),
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoActionSheet(
                                actions: [

                                  CupertinoActionSheetAction(
                                    child: Text('Administrador'),
                                    onPressed: () {},
                                  ),
                                  
                                  CupertinoActionSheetAction(
                                    child: Text('Usuario'),
                                    onPressed: () {},
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


                        CupertinoTextField(
                          placeholder: 'Codigo de acceso',
                        ),

                        SizedBox(height: 10),


                        CupertinoTextField(
                          placeholder: 'Usuario',
                        ),

                        SizedBox(height: 10),


                        CupertinoTextField(
                          placeholder: 'Contraseña',
                        ),

                        SizedBox(height: 10),
                        // DropdownButton(
                        //   items: [
                        //     DropdownMenuItem(
                        //       child: Text('Administrador'),
                        //       value: 'admin',
                        //     ),
                        //     DropdownMenuItem(
                        //       child: Text('Usuario'),
                        //       value: 'user',
                        //     ),
                        //   ],
                        //   onChanged: (value) {},
                        //   hint: Text('Tipo de usuario'),
                        // ),
                        // dropdown button estilo cupertino
                        CupertinoTextField(
                          placeholder: 'Repetir contraseña',
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: CupertinoButton(
                            onPressed: () {
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