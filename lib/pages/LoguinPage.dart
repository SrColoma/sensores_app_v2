import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/components/TopBarSliver.dart';
import 'package:sensores_app_v2/pages/PiscinasPage.dart';
import 'package:sensores_app_v2/pages/SensoresPage.dart';
import 'package:sensores_app_v2/providers/CamaronGetUsersProvider.dart';
import 'package:sensores_app_v2/providers/SessionProvider.dart';

class LoguinPage extends StatelessWidget {
  static const routeName = 'LoguinPage';
  const LoguinPage({super.key});

  @override
  Widget build(BuildContext context) {

    final camaronGetUsersProvider = Provider.of<CamaronGetUsersProvider>(context);
    final sessionProvider = Provider.of<SessionProvider>(context);

    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blue,
                ),
                child: Center(child: Image.asset(
                  'assets/images/logofci.png', 
                  width: 200,
                  height: 200,
                  
                ))
              ),
              const SizedBox(height: 10),
              const Text('Hola soy Salem\nEl socio camaron del acuicultor', 
                style: TextStyle(
                  color: Colors.blueGrey,
                  
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text('Iniciar Sesión', 
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              CupertinoTextField(
                placeholder: 'Usuario',
                controller: sessionProvider.userController,
              ),
              const SizedBox(height: 4),

              CupertinoTextField(
                placeholder: 'Contraseña',
                obscureText: true,
                controller: sessionProvider.passwordController,
              ),

              Text(sessionProvider.mensaje, 
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              
              CupertinoButton(
                  child: const Text('Iniciar Sesión'),
                  onPressed: () => {
                    camaronGetUsersProvider.camaronGetUsers.body.items.forEach((e) {
                      if (sessionProvider.userController.text.trim() == e.user 
                        && sessionProvider.passwordController.text.trim() == e.password)
                      {
                        sessionProvider.user = e.user;
                        sessionProvider.piscina = "";
                        sessionProvider.rol = e.rol;
                        Navigator.pushReplacementNamed(context, PiscinasPage.routeName);
                        return;
                      }
                      else{
                        sessionProvider.mensaje = 'Usuario o contraseña incorrectos';
                      }
                    })
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
