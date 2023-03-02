import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/providers/PageProvider.dart';

import '../widgets/dialogs/NuevoFrecuenciaDialog.dart';

class TopBarSliver extends StatelessWidget implements PreferredSizeWidget {
  bool showActions;
  TopBarSliver({
    super.key,
    this.showActions = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  // get showActions => this.showActions;
  
  // get showActions => showActions;

  @override
  Widget build(BuildContext context) {

    PageProvider pageProvider = Provider.of<PageProvider>(context);

    return SliverPadding(
      padding: EdgeInsets.all(8.0),
      sliver: showActions
      ?SliverAppBar(

        flexibleSpace: FlexibleSpaceBar(
          title: Text(pageProvider.title),
        ),

        actions: 
        [
          // boton de recargar la pagina
          Padding(
            padding: EdgeInsets.only(right: 2.0),
            child : IconButton(
              onPressed:() => {
                // recaragar el contenido de los providers
                // Navigator.pushReplacementNamed(context, pageProvider.routeName);
              },
              icon: Icon(Icons.refresh),
            ),
            
          ),

          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child : TextButton(
              onPressed:() => {
                showDialog(context: context, 
                  builder: (_)  => pageProvider.dialogoSeleccionado,
                ),
              },
              child: Text(pageProvider.buttonString,style: TextStyle(color: Colors.white),),
            ),
            // decoracion del boton
            
          ),
        ],
        // decoracion de la barra
        floating: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      )
      :SliverAppBar(
        flexibleSpace: FlexibleSpaceBar(
          title: Text(pageProvider.title),
        ),
        floating: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
  
}