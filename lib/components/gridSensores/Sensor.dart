

import 'package:flutter/material.dart';
import 'package:sensores_app_v2/models/Point.dart';

import 'graficoLineaPorFechas.dart';

class Sensor extends StatelessWidget {
  final String imagen;
  final String titulo;
  final String media;
  List<Point> puntos;


  Sensor({
    super.key, 
    required this.imagen, 
    required this.titulo, 
    required this.media, 
    required this.puntos
  });



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: Image.asset(imagen).image,

            ),
            
            Text(titulo,style: TextStyle(fontSize: 20),),
            Text(media,style: TextStyle(fontSize: 20),),
          ],
        ),
        // GraficoLineaPorFecha(
        //   data: puntos
        // ),
        GraficoLineaPorFecha(
          data: puntos
        ),
        // graficoTMP(
        //   puntos: puntos
        // ),
        // Text(MediaQuery.of(context).size.width.toString()),

      ],
    );
  }
}