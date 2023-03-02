import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/components/MenuDrawer.dart';
import 'package:sensores_app_v2/components/TablaSliver/CustomDataTable.dart';
import 'package:sensores_app_v2/components/TopBarSliver.dart';
import 'package:sensores_app_v2/providers/CamaronGetAllValoresProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetBoxConfigProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetReportesProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetUsersProvider.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevoFrecuenciaDialog.dart';

import '../components/TablaSliver/TablaSliver.dart';
import '../providers/PageProvider.dart';

class TestRoomPage extends StatelessWidget {
  static const routeName = 'TestRoomPage';
  static const title = 'T E S T - R O O M';
  static const buttonString = "test button";
  static NuevoFrecuenciaDialog funcionNuevaFrecuencia = NuevoFrecuenciaDialog();

  const TestRoomPage({super.key});

  @override
  Widget build(BuildContext context) {

    final camaronGetAllValoresProvider = Provider.of<CamaronGetAllValoresProvider>(context);
    final camaronGetBoxConfigProvider = Provider.of<CamaronGetBoxConfigProvider>(context);
    final camaronGetUsersProvider = Provider.of<CamaronGetUsersProvider>(context);
    final camaronGetReportesProvider = Provider.of<CamaronGetReportesProvider>(context);

    final pageProvider = Provider.of<PageProvider>(context);

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

            
            camaronGetAllValoresProvider.rows.isNotEmpty
            ? TablaSliver(
                titulo: "Valores sensados",
                descripcion: "valores censados de la caja",
                columns: camaronGetAllValoresProvider.columns,
                rows: camaronGetAllValoresProvider.rows,
              )
            : const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),



            camaronGetBoxConfigProvider.rows.isNotEmpty
            ? TablaSliver(
                titulo: "configuracion de la caja",
                descripcion: "configuracion de la caja",
                columns: camaronGetBoxConfigProvider.columns,
                rows: camaronGetBoxConfigProvider.rows,
              )
            : const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),



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



            camaronGetReportesProvider.rows.isNotEmpty
            ? TablaSliver(
                titulo: "Reportes",
                descripcion: "Reportes",
                columns: camaronGetReportesProvider.columns,
                rows: camaronGetReportesProvider.rows,
              )
            : const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),


            // TablaSliver(
            //   titulo: "Piscinas",
            //   descripcion: "Piscinas",
            //   columns: ["id","nombre"],
            //   rows: [
            //     ["1","Piscina1"],
            //     ["2","Piscina2"],
            //     ["3","Piscina3"],
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}