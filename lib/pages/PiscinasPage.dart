import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/components/MenuDrawer.dart';
import 'package:sensores_app_v2/components/TablaSliver/TablaSliver.dart';
import 'package:sensores_app_v2/components/TopBarSliver.dart';
import 'package:sensores_app_v2/components/gridPiscinas/PiscinasGrid.dart';
import 'package:sensores_app_v2/providers/SessionProvider.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevaPiscinaDialog.dart';

import '../providers/PageProvider.dart';

class PiscinasPage extends StatelessWidget {
  static const routeName = 'PiscinasPage';
  static const title = 'P I S C I N A S';
  static const buttonString = "Agregar Piscina";
  static NuevaPiscinaDialog funcionNuevaFrecuencia = NuevaPiscinaDialog();

  PiscinasPage({super.key});


  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context);
    final sessionProvider = Provider.of<SessionProvider>(context);


    pageProvider.routeName = routeName;
    pageProvider.title = title;
    pageProvider.buttonString = buttonString;
    pageProvider.dialogoSeleccionado = funcionNuevaFrecuencia;

    final double maxWidth = MediaQuery.of(context).size.width;
    final double itemWidth = 200.0;
    final int columnCount = (maxWidth / itemWidth).floor();
    // final double spacing = (maxWidth - (itemWidth * columnCount)) / (columnCount + 1);

    return Scaffold(
      drawer: const MenuDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [

            TopBarSliver(
              showActions: sessionProvider.canUsed,
            ),


            SliverToBoxAdapter(
              child: Container(
                height: 50,
                child: const Center(
                  child: Text('Selecciona una piscina para ver sus sensores'),
                ),
              ),
            ),


            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columnCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PiscinasGrid(index: index),
                  childCount: sessionProvider.piscinas.length,
                ),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}