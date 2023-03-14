

import 'package:flutter/material.dart';
import 'package:sensores_app_v2/models/Point.dart';

import 'graficoLineaPorFechas.dart';

class Sensor extends StatelessWidget {
  final String imagen;
  final String titulo;
  final String media;
  List<Point> puntos;

  double minimo;

  double maximo;


  Sensor({
    super.key, 
    required this.imagen, 
    required this.titulo, 
    required this.media, 
    required this.puntos, 
    required this.maximo, 
    required this.minimo
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
            Text(
              'µ: ${calcularMedia(puntos).toStringAsFixed(1)} $media',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        // GraficoLineaPorFecha(
        //   data: puntos
        // ),
        GraficoLineaPorFecha(
          data: puntos,
          minimo: minimo,
          maximo: maximo,
          titulo: media,
        ),
        // graficoTMP(
        //   puntos: puntos
        // ),
        // Text(MediaQuery.of(context).size.width.toString()),

      ],
    );
  }
  double calcularMedia(List<Point> puntos) {
    double suma = 0;
    for (var punto in puntos) {
      suma += punto.valor;
    }
    double media = suma / puntos.length;
    return media;
  }
}