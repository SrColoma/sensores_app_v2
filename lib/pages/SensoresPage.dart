import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/components/MenuDrawer.dart';
import 'package:sensores_app_v2/components/TablaSliver/CustomDataTable.dart';
import 'package:sensores_app_v2/components/TopBarSliver.dart';
import 'package:sensores_app_v2/components/gridSensores/Sensor.dart';
import 'package:sensores_app_v2/components/gridSensores/SensoresGrid.dart';
import 'package:sensores_app_v2/providers/CamaronGetAllValoresProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetPiscinasProvider.dart';
import 'package:sensores_app_v2/providers/SessionProvider.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevoFrecuenciaDialog.dart';

import '../components/TablaSliver/TablaSliver.dart';
import '../providers/PageProvider.dart';
import 'TestRoomPage.dart';

class SensoresPage extends StatelessWidget {
  static const routeName = 'SensoresPage';
  static const title = 'S E N S O R E S';
  static const buttonString = "Frecuencia";
  static NuevoFrecuenciaDialog funcionNuevaFrecuencia = NuevoFrecuenciaDialog();

  const SensoresPage({super.key});

  @override
  Widget build(BuildContext context) {

    final  camaronGetAllValoresProvider = Provider.of<CamaronGetAllValoresProvider>(context);
    final camaronGetPiscinasProvider = Provider.of<CamaronGetPiscinasProvider>(context);

    final pageProvider = Provider.of<PageProvider>(context);
    final sessionProvider = Provider.of<SessionProvider>(context);

    pageProvider.routeName = routeName;
    pageProvider.title = title;
    pageProvider.buttonString = buttonString;
    pageProvider.dialogoSeleccionado = funcionNuevaFrecuencia;

    final double maxWidth = MediaQuery.of(context).size.width;
    int columnCount = 1;
    if (maxWidth > 1000){
      columnCount = 3;
    }else if (maxWidth > 800){
      columnCount = 2;
    }
    double itemWidth = maxWidth/columnCount;
    // final int columnCount = (maxWidth / itemWidth).floor();
    // final double spacing = (maxWidth - (itemWidth * columnCount)) / (columnCount + 1);

    return Scaffold(
      drawer: MenuDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          // scrollBehavior: const ScrollBehavior(),
          slivers: [
            TopBarSliver(),

            // boton dentro de un sliver que redirige a la pagina de testroom
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: ElevatedButton(
            //       child: Text("Test Room"),
            //       onPressed: () {
            //         Navigator.of(context).pushReplacementNamed(TestRoomPage.routeName);
            //       },
            //     ),
            //   ),
            // ),

            // si no ha seleccionado una piscina muestra un mensaje y no muestra los graficos
            // si ha seleccionado una piscina muestra los graficos
            if (camaronGetPiscinasProvider.piscinas.contains(sessionProvider.piscina))
            // TODO : aqui esta el grafico que se debe repetir
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columnCount,
                    crossAxisSpacing: 10,//spacing,
                    mainAxisSpacing: 10,//spacing,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => SensoresGrid(index: index),
                    childCount: camaronGetAllValoresProvider.sensores.length,
                  ),
                ),
              )
            else(
              SliverToBoxAdapter(
                child: Container(
                  height: 50,
                  child: const Center(
                    child: Text('Selecciona una piscina para ver sus sensores'),
                  ),
                ),
              )
            )


          ],
        ),
      ),
    );
  }
}