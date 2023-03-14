import 'package:flutter/material.dart';
import 'package:sensores_app_v2/models/Point.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_test/flutter_test.dart';

class GraficoLineaPorFecha extends StatefulWidget{
  final double minimo;
  
  final double maximo;
  
  final String titulo;

  const GraficoLineaPorFecha({
    Key? key,
    required this.data,
    required this.minimo,
    required this.maximo,
    required this.titulo,
  }) : super(key: key);

  final List<Point> data;

  @override
  State<GraficoLineaPorFecha> createState() => _GraficoLineaPorFechaState();
}

class _GraficoLineaPorFechaState extends State<GraficoLineaPorFecha> {
  
  late ZoomPanBehavior _zoomPanBehavior;
    
  @override
  void initState(){
    _zoomPanBehavior = ZoomPanBehavior(
                  enablePinching: true,
                  zoomMode: ZoomMode.x,
                  enablePanning: true,
                  // enableMouseWheelZooming : true,

                  

              );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // CustomScrollView customscrollview = find.byType(CustomScrollView).evaluate().first.widget as CustomScrollView;
    // customscrollview.controller?.jumpTo(0.0);

    return SfCartesianChart(
      zoomPanBehavior: _zoomPanBehavior,
    
      primaryXAxis: DateTimeAxis(
      ),
    
      primaryYAxis: NumericAxis(
        labelFormat: '{value} ${widget.titulo}',
        anchorRangeToVisiblePoints: true,
        plotBands: <PlotBand>[
          PlotBand(
            isVisible: true,
            start: widget.maximo,
            end: widget.maximo,
            borderWidth: 2,
            borderColor: Colors.red,
          ),
          PlotBand(
            isVisible: true,
            start: widget.minimo,
            end: widget.minimo,
            borderWidth: 2,
            borderColor: Colors.red,
          ),
          
        ],
        // labelRotation: 90,
      ),
      // Chart title
      // title: ChartTitle(text: 'Half yearly sales analysis'),
      // Enable legend
      // legend: Legend(isVisible: true),
      // Enable tooltip
      
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<Point, DateTime>>[
        ScatterSeries<Point, DateTime>(
          dataSource: widget.data,
          xValueMapper: (Point punto, _) => DateTime.parse(punto.fecha),
          yValueMapper: (Point punto, _) => punto.valor,
          name: 'valores',
          // Enable data label
          // dataLabelSettings: DataLabelSettings(isVisible: true)
        ),
      ],
      annotations: <CartesianChartAnnotation>[
        // BoxAnnotation for minimo
        CartesianChartAnnotation(
          widget: Container(
            // height: 10,
            // width: double.infinity,
            color: Colors.red,
            child: Text('minimo'),
          ),
          coordinateUnit: CoordinateUnit.point,
          x: 0,
          y: -1,
        ),
        // BoxAnnotation for maximo
        CartesianChartAnnotation(
          widget: Container(
            height: 5,
            // width: double.infinity,
            color: Colors.red,
            child: Text('maximo'),
          ),
          coordinateUnit: CoordinateUnit.point,
          x: 0,
          y: 1,
        ),
      ],
    );
  }
}












// class GraficoLineaPorFecha extends StatelessWidget{
//   const GraficoLineaPorFecha({
//     Key? key,
//     required this.data,
//   }) : super(key: key);

//   final List<Point> data;

//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(

//       primaryXAxis: CategoryAxis(),
//       // Chart title
//       // title: ChartTitle(text: 'Half yearly sales analysis'),
//       // Enable legend
//       // legend: Legend(isVisible: true),
//       // Enable tooltip
      
//       tooltipBehavior: TooltipBehavior(enable: true),
//       series: <ChartSeries<Point, String>>[
//         LineSeries<Point, String>(
//           dataSource: data,
//           xValueMapper: (Point punto, _) => punto.fecha,
//           yValueMapper: (Point punto, _) => punto.valor,
//           name: 'valores',
//           // Enable data label
//           dataLabelSettings: DataLabelSettings(isVisible: true)
//         ),
//       ],
//     );
//   }

// }