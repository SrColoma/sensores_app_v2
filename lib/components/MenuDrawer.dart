import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/pages/LoguinPage.dart';
import 'package:sensores_app_v2/pages/PiscinasPage.dart';
import 'package:sensores_app_v2/pages/ReportesPage.dart';
import 'package:sensores_app_v2/pages/SensoresPage.dart';
import 'package:sensores_app_v2/pages/UsuariosPage.dart';
import 'package:sensores_app_v2/providers/SessionProvider.dart';



class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                //redondeado la parte de la derecha
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                color: Colors.blue,
              ),
              child: Center(
                child:  Image(
                  image: AssetImage('assets/images/logofci.png'),
                  width: 200,
                ),
              ),
            ),

            const SizedBox(height: 10),

            getTittle(sessionProvider.user, Icons.person),
            getTittle(sessionProvider.piscina, Icons.pool),

            const SizedBox(height: 10),

            getTile('S E N S O R E S', Icons.settings_remote_rounded, SensoresPage.routeName, context),
            getTile('P I S C I N A S', Icons.pool, PiscinasPage.routeName, context),
            getTile('R E P O R T E S', Icons.pie_chart, ReportesPage.routeName, context),
            getTile('U S U A R I O S', Icons.people, UsuariosPage.routeName, context),

            

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('C E R R A R  S E S I O N'),
              onTap: () {
                sessionProvider.user = '';
                sessionProvider.piscina = '';
                sessionProvider.mensaje = '';
                sessionProvider.userController.text = '';
                sessionProvider.passwordController.text = '';
                Navigator.pushReplacementNamed(context, LoguinPage.routeName);
              },
            ),
            
          ],
        ),
      ),
    );
  }

  ListTile getTile(String texto,IconData icono,String pageName,BuildContext context) {
    return ListTile(
            leading: Icon(icono),
            title: Text(texto),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pushReplacementNamed(context, pageName);
            },
          );
  }



  Padding getTittle(String titulo, IconData icono) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Text(
            titulo,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              // fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),

          const SizedBox(width: 10),
          // icono de usuario
          Icon(icono, color: Colors.grey),

        ],
      ),
    );
  }
}