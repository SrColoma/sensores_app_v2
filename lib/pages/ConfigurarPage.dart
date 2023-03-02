import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/components/MenuDrawer.dart';
import 'package:sensores_app_v2/components/TablaSliver/TablaEditableSliver.dart';
import 'package:sensores_app_v2/components/TablaSliver/TablaSliver.dart';
import 'package:sensores_app_v2/components/TopBarSliver.dart';
import 'package:sensores_app_v2/models/camaronGetBoxConfig.dart';
import 'package:sensores_app_v2/providers/CamaronGetAlertasProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetBoxConfigProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetReportesProvider.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevoReporteDialog.dart';

import '../providers/PageProvider.dart';

class ConfigurarPage extends StatefulWidget {
  static const routeName = 'ConfigurarPage';
  static const title = 'C O N F I G U R A R';
  static const buttonString = "";
  // static NuevoReporteDialog funcionNuevaFrecuencia = NuevoReporteDialog();

  const ConfigurarPage({super.key});

  @override
  State<ConfigurarPage> createState() => _ConfigurarPageState();
}

class _ConfigurarPageState extends State<ConfigurarPage> {
  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context);
    // final camaronGetReportesProvider = Provider.of<CamaronGetReportesProvider>(context);
    // final camaronGetAlertasProvider = Provider.of<CamaronGetAlertasProvider>(context);
    final camaronGetBoxConfigProvider = Provider.of<CamaronGetBoxConfigProvider>(context);

    pageProvider.routeName = ConfigurarPage.routeName;
    pageProvider.title = ConfigurarPage.title;
    pageProvider.buttonString = ConfigurarPage.buttonString;
    // pageProvider.dialogoSeleccionado = funcionNuevaFrecuencia;

    return Scaffold(
      drawer: MenuDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            TopBarSliver(showActions: false),

            camaronGetBoxConfigProvider.rows.isNotEmpty
            ? TablaEditableSliver(
                titulo: "Configuracion",
                descripcion: "Configuracion actual",
                columns: camaronGetBoxConfigProvider.columns,
                rows: camaronGetBoxConfigProvider.rows,
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