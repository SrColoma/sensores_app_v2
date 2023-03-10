import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/providers/CamaronGetAllValoresProvider.dart';
import 'package:sensores_app_v2/providers/CamaronGetReportesProvider.dart';
import 'package:sensores_app_v2/providers/PdfProvider.dart';

class CustomDescargableDataTable extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;

  const CustomDescargableDataTable({
    super.key, 
    required this.columns, 
    required this.rows
  });

  @override
  Widget build(BuildContext context) {

    return DataTable(
      columns: getColumns(),
      rows: getRows(context),
    );
  }

  List<DataColumn> getColumns() {
    List<DataColumn> newColumns = [];

    // agregar las columnas existentes
    for (String column in columns) {
      newColumns.add(DataColumn(label: Text(column)));
    }

    // agregar la nueva columna
    newColumns.add(DataColumn(label: Text('')));

    return newColumns;
  }


  List<DataRow> getRows(context) {
    final camaronGetAllValoresProvider = Provider.of<CamaronGetAllValoresProvider>(context);
    final camaronGetReportesProvider = Provider.of<CamaronGetReportesProvider>(context);
    return rows.map((row) {
      List<DataCell> cells = [];
      for (int i = 0; i < row.length; i++) {
        cells.add(DataCell(Text(row[i])));
      }

      // agregar la celda de botón de descarga
      cells.add(DataCell(
        IconButton(
          icon: Icon(Icons.download),
          onPressed: () {
            // TODO: cambiar el provider a uno que corten los datos de la fila
            // row[2] = fechainicio
            // row[3] = fechafin
            var columns = camaronGetAllValoresProvider.columns;
            List<List<String>> rangorows = camaronGetAllValoresProvider.getRango(row[2], row[3]);
            final titulo = 'Reporte de sensores del ${row[2]} al ${row[3]}';
            PdfProvider.generatePdf(columns, rangorows, titulo);
          },
        ),
      ));

      return DataRow(cells: cells);
    }).toList();
  }
}