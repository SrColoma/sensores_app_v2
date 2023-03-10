import 'package:flutter/material.dart';

import 'CustomDescargableDataTable.dart';

class TablaDescargableSliver extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final List<String> columns;
  final List<List<String>> rows;

  const TablaDescargableSliver({
    super.key, 
    required this.titulo, 
    required this.descripcion, 
    required this.columns, 
    required this.rows
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Text(titulo,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text(descripcion),
              CustomDescargableDataTable(
                columns: columns,
                rows: rows,
              )
            ],
          ),
        ),
      ),
    );
  }
}