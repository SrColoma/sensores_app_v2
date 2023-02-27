import 'package:flutter/material.dart';

import 'CustomDataTable.dart';

class TablaSliver extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final List<String> columns;
  final List<List<String>> rows;

  const TablaSliver({
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
          CustomDataTable(
            columns: columns,
            rows: rows,
          )
        ],
      ),
    );
  }
}