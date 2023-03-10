import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/components/MenuDrawer.dart';
import 'package:sensores_app_v2/components/TablaSliver/TablaSliver.dart';
import 'package:sensores_app_v2/components/TopBarSliver.dart';
import 'package:sensores_app_v2/providers/CamaronGetAlertasProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetReportesProvider.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevoReporteDialog.dart';

import '../components/TablaSliver/TablaDescargableSliver.dart';
import '../providers/PageProvider.dart';

class ReportesPage extends StatelessWidget {
  static const routeName = 'ReportesPage';
  static const title = 'R E P O R T E S';
  static const buttonString = "Nuevo Reporte";
  static NuevoReporteDialog funcionNuevaFrecuencia = NuevoReporteDialog();

  const ReportesPage({super.key});

  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context);
    final camaronGetReportesProvider = Provider.of<CamaronGetReportesProvider>(context);
    // final camaronGetAlertasProvider = Provider.of<CamaronGetAlertasProvider>(context);

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

            camaronGetReportesProvider.rows.isNotEmpty
            ? TablaDescargableSliver(
                titulo: "Reportes",
                descripcion: "Reportes",
                columns: camaronGetReportesProvider.columns,
                rows: camaronGetReportesProvider.rows,
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