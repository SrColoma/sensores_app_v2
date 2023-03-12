import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sensores_app_v2/providers/CamaronAddUserProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetUsersProvider.dart';

class NuevoUserDialog extends StatefulWidget {

  const NuevoUserDialog({super.key});

  @override
  State<NuevoUserDialog> createState() => _NuevoUserDialogState();
}

class _NuevoUserDialogState extends State<NuevoUserDialog> {
  var _email = "";
  var _usuario = "";
  var _contrasenia = "";
  var _rol = "admin";

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final camaronAddUserProvider = Provider.of<CamaronAddUserProvider>(context);
    final camaronGetUsersProvider = Provider.of<CamaronGetUsersProvider>(context);

    return AlertDialog(
      title: Text('Nuevo Usuario'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Correo electrónico',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,

                ),
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese un correo electrónico.';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Ingrese un correo electrónico válido.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,

                ),
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una contraseña.';
                  }
                  if (value.length < 6) {
                    return 'Debe tener al menos 6 caracteres.';
                  }
                  if (!value.contains(new RegExp(r'[0-9]'))) {
                    return 'Debe tener al menos un número.';
                  }
                  if (!value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                    return 'Debe tener al menos un símbolo.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Repetir contraseña',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,

                ),
                controller: _repeatedPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor repita su contraseña.';
                  }
                  if (value != _passwordController.text) {
                    return 'Las contraseñas no coinciden.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: 'Rol',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
                value: _rol,
                onChanged: (String? value) {
                  setState(() {
                    _rol = value!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: "admin",
                    child: Text("admin"),
                  ),
                  DropdownMenuItem(
                    value: "user",
                    child: Text("user"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Agregar'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _email = _emailController.text;
              _contrasenia = _passwordController.text;
              _usuario = _email.split('@')[0];
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
                        camaronAddUserProvider.email = _email;
                        camaronAddUserProvider.password = _contrasenia;
                        camaronAddUserProvider.rol = _rol;
                        camaronGetUsersProvider.rows = [];
                        camaronAddUserProvider.enviarPeticionAddUser().then((value){
                          camaronGetUsersProvider.getCamaronGetUsers();

                        });

                      },
                    ),
                  ],
                ),
              );
              // Navigator.of(context).pop();
            }else{
              print('no valido');
            }
          },
        ),
      ],
    );
  }
}
