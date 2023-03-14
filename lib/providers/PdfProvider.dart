import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class PdfProvider with ChangeNotifier {
  static Future<void> generatePdf(List<String> columns, List<List<String>> rows, String titulo) async {
    final pdf = pw.Document();
    final image = pw.MemoryImage(
        File('assets/images/logofci.png').readAsBytesSync(),
    );

    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) => [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Salem Shrimp System'),
              pw.Image(image, width: 50, height: 50),
            ],
          ),
          pw.Text(titulo),
          pw.Table.fromTextArray(
            context: context,
            data: rows,
            headerDecoration: pw.BoxDecoration(
              color: PdfColors.grey300,
            ),
            headerHeight: 25,
            cellHeight: 30,
            cellStyle: pw.TextStyle(
              color: PdfColors.black,
              fontSize: 14,
            ),
            headers: columns,
          ),
        ],
      ),
    );

    // final file = File('/home/sr-coloma/Descargas/00AA/$titulo.pdf');
    // final file = File('$titulo.pdf');
    // await file.writeAsBytes(await pdf.save());


    // final bytes = await pdf.save();
    final filePath = '../$titulo.pdf';
    // final file = File(filePath);
    // print(file.path);
    // await file.writeAsBytes(bytes);

    final bytes = await pdf.save();
    final fileName = '$titulo.pdf';

    // final filePath = path.join(
    //   Platform.environment['USERPROFILE']!, 'Downloads', fileName
    // );

    final file = File(filePath);
    await file.writeAsBytes(bytes);

  }
  
}