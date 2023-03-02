import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/components/MenuDrawer.dart';
import 'package:sensores_app_v2/components/TablaSliver/TablaSliver.dart';
import 'package:sensores_app_v2/components/TopBarSliver.dart';
import 'package:sensores_app_v2/providers/CamaronGetUsersProvider.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevoUserDialog.dart';

import '../providers/PageProvider.dart';

class UsuariosPage extends StatefulWidget {
  static const routeName = 'UsuariosPage';
  static const title = 'U S U A R I O S';
  static const buttonString = "Agregar Usuario";
  static NuevoUserDialog funcionNuevaFrecuencia = NuevoUserDialog();

  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context);
    final camaronGetUsersProvider = Provider.of<CamaronGetUsersProvider>(context);

    pageProvider.routeName = UsuariosPage.routeName;
    pageProvider.title = UsuariosPage.title;
    pageProvider.buttonString = UsuariosPage.buttonString;
    pageProvider.dialogoSeleccionado = UsuariosPage.funcionNuevaFrecuencia;

    return Scaffold(
      drawer: MenuDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            TopBarSliver(),

            camaronGetUsersProvider.rows.isNotEmpty
            ? TablaSliver(
                titulo: "Usuarios",
                descripcion: "Usuarios",
                columns: camaronGetUsersProvider.columns,
                rows: camaronGetUsersProvider.rows,
              )
            : const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
            
          ],
        ),
      ),
    );
  }
}