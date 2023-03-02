// TablaEditableSliver
import 'package:flutter/material.dart';
import 'package:sensores_app_v2/components/TablaSliver/CustomEditableDataTable.dart';


class TablaEditableSliver extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final List<String> columns;
  final List<List<String>> rows;

  TablaEditableSliver({
    super.key, 
    required this.titulo, 
    required this.descripcion, 
    required this.columns, 
    required this.rows
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Text(titulo,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text(descripcion),
          CustomEditableDataTable(
            columns: columns,
            rows: rows,
          )
        ],
      ),
    );
  }
}