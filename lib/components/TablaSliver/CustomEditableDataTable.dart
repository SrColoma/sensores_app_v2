// CustomEditableDataTable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensores_app_v2/widgets/dialogs/ChangeConfigDialog.dart';
import 'package:sensores_app_v2/widgets/dialogs/NuevaPiscinaDialog.dart';

class CustomEditableDataTable extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;

  CustomEditableDataTable({
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
    return columns
        .map((column) => DataColumn(
              label: Text(column),
            ))
        .toList();
  }

  List<DataRow> getRows(context) {
    return rows.map((row) {
      List<DataCell> cells = [];
      for (int i = 0; i < row.length; i++) {
        if (i == row.length - 1) {
          cells.add(DataCell(
            Text(row[i]),
            showEditIcon: true,
            onTap: () {
              // Abrir el editor de la última celda
              final TextEditingController controller = TextEditingController(text: row[i]);
              showDialog(
                context: context, 
                builder: (_) => ChangeConfigDialog(controller, row[1], row[2])
                // cambiar el valor de la última celda
                
              );
            },
          ));
        } else {
          cells.add(DataCell(Text(row[i])));
        }
      }
      return DataRow(cells: cells);
    }).toList();
  }
}
