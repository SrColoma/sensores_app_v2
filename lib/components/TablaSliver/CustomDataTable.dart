import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;

  CustomDataTable({
    required this.columns, 
    required this.rows
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: getColumns(),
      rows: getRows(),
    );
  }

  List<DataColumn> getColumns() {
    return columns
        .map((column) => DataColumn(
              label: Text(column),
            ))
        .toList();
  }

  List<DataRow> getRows() {
    return rows.map((row) {
      List<DataCell> cells = row.map((cell) => DataCell(Text(cell))).toList();
      return DataRow(cells: cells);
    }).toList();
  }
}
