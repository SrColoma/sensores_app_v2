import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/widgets/formas/StatusDot.dart';
import 'package:sensores_app_v2/providers/SessionProvider.dart';

import '../../providers/CamaronGetPiscinasProvider.dart';

class PiscinasGrid extends StatelessWidget {
  final int index;

  const PiscinasGrid({
    super.key, 
    required this.index
  });
  

  @override
  Widget build(BuildContext context) {

    final sessionProvider = Provider.of<SessionProvider>(context);
    final camaronGetPiscinasProvider = Provider.of<CamaronGetPiscinasProvider>(context);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      // onTap: () => sessionProvider.piscina = camaronGetPiscinasProvider.piscinas[index],
      onTap: () => sessionProvider.piscina = camaronGetPiscinasProvider.rows[index][1],
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Center(
                child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(camaronGetPiscinasProvider.rows[index][1]),
                      // boton para eliminar la piscina
                      IconButton(
                        // icono de ver detalles
                        icon: const Icon(Icons.tune_rounded,color: Colors.blue,),
                        // icon: const Icon(Icons.delete,color: Colors.red,),
                        // onPressed: () => camaronGetPiscinasProvider.deletePiscina(camaronGetPiscinasProvider.rows[index][0]),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(camaronGetPiscinasProvider.rows[index][1]),
                              content: Text("Capacidad: ${camaronGetPiscinasProvider.rows[index][3]}"),
                              // actions: [
                              //   TextButton(
                              //     child: const Text('Eliminar',style: TextStyle(color: Colors.red),),
                              //     onPressed: () {
                              //       Navigator.pop(context);
                              //       camaronGetPiscinasProvider.deletePiscina(camaronGetPiscinasProvider.rows[index][0]);
                              //     },
                              //   ),
                              //   TextButton(
                              //     child: const Text('Ok'),
                              //     onPressed: () {
                              //       Navigator.pop(context);
                              //       // camaronGetPiscinasProvider.deletePiscina(index);
                              //     },
                              //   ),
                              // ],
                            ),
                          );
                        },
                      ),
                    ],
                  )
              ),
              StatusDot( 
                sessionProvider.piscina == camaronGetPiscinasProvider.rows[index][1]
                ? Colors.green 
                : Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}