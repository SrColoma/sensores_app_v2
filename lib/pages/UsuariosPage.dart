import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/components/MenuDrawer.dart';
import 'package:sensores_app_v2/components/TablaSliver/TablaSliver.dart';
import 'package:sensores_app_v2/components/TopBarSliver.dart';
import 'package:sensores_app_v2/providers/CamaronGetUsersProvider.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevoFrecuenciaDialog.dart';

import '../providers/PageProvider.dart';

class UsuariosPage extends StatelessWidget {
  static const routeName = 'UsuariosPage';
  static const title = 'U S U A R I O S';
  static const buttonString = "Agregar Usuario";
  static NuevoFrecuenciaDialog funcionNuevaFrecuencia = NuevoFrecuenciaDialog();

  const UsuariosPage({super.key});

  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context);
    final camaronGetUsersProvider = Provider.of<CamaronGetUsersProvider>(context);

    pageProvider.routeName = routeName;
    pageProvider.title = title;
    pageProvider.buttonString = buttonString;
    pageProvider.dialogoSeleccionado = funcionNuevaFrecuencia;

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