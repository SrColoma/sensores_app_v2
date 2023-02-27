import 'package:flutter/material.dart';
import 'package:sensores_app_v2/models/Point.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoLineaPorFecha extends StatelessWidget{
  const GraficoLineaPorFecha({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Point> data;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(

      primaryXAxis: CategoryAxis(),
      // Chart title
      // title: ChartTitle(text: 'Half yearly sales analysis'),
      // Enable legend
      // legend: Legend(isVisible: true),
      // Enable tooltip
      
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<Point, String>>[
        LineSeries<Point, String>(
          dataSource: data,
          xValueMapper: (Point punto, _) => punto.fecha,
          yValueMapper: (Point punto, _) => punto.valor,
          name: 'valores',
          // Enable data label
          dataLabelSettings: DataLabelSettings(isVisible: true)
        ),
      ],
    );
  }

}