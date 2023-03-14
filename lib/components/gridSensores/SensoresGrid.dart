import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/providers/CamaronGetAllValoresProvider.dart';
import 'package:sensores_app_v2/providers/SessionProvider.dart';

import 'Sensor.dart';

class SensoresGrid extends StatelessWidget {
  final int index;

  const SensoresGrid({
    super.key, 
    required this.index
  });
  

  @override
  Widget build(BuildContext context) {

    final sessionProvider = Provider.of<SessionProvider>(context);
    final camaronGetAllValoresProvider = Provider.of<CamaronGetAllValoresProvider>(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Center(
            //   child: camaronGetAllValoresProvider.sensores[index]
            // ),
            if(sessionProvider.piscina == sessionProvider.fakePiscina)
              !camaronGetAllValoresProvider.isLoading
              ? Center(
                child: camaronGetAllValoresProvider.sensores[index]
              )
              : (Center(child: CircularProgressIndicator()))
            else(
              Center(
                child: Text('Piscina no conectada')
              )
            )
            // StatusDot( 
            //   sessionProvider.piscina == sessionProvider.piscinas[index] ? Colors.green : Colors.white,
            // ),
          ],
        ),
      ),
    );
  }
}