import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/components/MenuDrawer.dart';
import 'package:sensores_app_v2/components/TablaSliver/TablaSliver.dart';
import 'package:sensores_app_v2/components/TopBarSliver.dart';
import 'package:sensores_app_v2/providers/CamaronGetAlertasProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetReportesProvider.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevoReporteDialog.dart';

import '../providers/PageProvider.dart';

class AlertasPage extends StatelessWidget {
  static const routeName = 'AlertasPage';
  static const title = 'A L E R T A S';
  static const buttonString = "";
  static NuevoReporteDialog funcionNuevaFrecuencia = NuevoReporteDialog();

  const AlertasPage({super.key});

  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context);
    // final camaronGetReportesProvider = Provider.of<CamaronGetReportesProvider>(context);
    final camaronGetAlertasProvider = Provider.of<CamaronGetAlertasProvider>(context);

    pageProvider.routeName = routeName;
    pageProvider.title = title;
    pageProvider.buttonString = buttonString;
    pageProvider.dialogoSeleccionado = funcionNuevaFrecuencia;

    return Scaffold(
      drawer: MenuDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            TopBarSliver(showActions: false),

            camaronGetAlertasProvider.rows.isNotEmpty
            ? TablaSliver(
                titulo: "Alertas",
                descripcion: "Alertas",
                columns: camaronGetAlertasProvider.columns,
                rows: camaronGetAlertasProvider.rows,
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