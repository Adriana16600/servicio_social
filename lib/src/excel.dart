import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Export {
  exportarHistorialAlumno(BuildContext context, DocumentSnapshot alumno) async {
    Excel excel = Excel.createExcel();
    Sheet sheetObject;
    sheetObject = excel['Sheet1'];
    List<String> abcs = [
      'a',
      'b',
      'c',
      'd',
    ];
    var titles = [
      'Dia', //a
      'Entrada', //b
      'Salida', //c
      'Total hrs' //d
    ];
    for (int i = 0; i < titles.length; i++) {
      sheetObject.cell(CellIndex.indexByString("${abcs[i]}2")).value =
          titles[i];
    }

    sheetObject.cell(CellIndex.indexByString("a1")).value = 'nombre';
    sheetObject.cell(CellIndex.indexByString("b1")).value =
        '${alumno['nombre']} ${alumno['apaterno']}${alumno['amaterno']}';
    sheetObject.cell(CellIndex.indexByString("c1")).value = 'control';
    sheetObject.cell(CellIndex.indexByString("d1")).value = alumno['nocontrol'];
    sheetObject.cell(CellIndex.indexByString("e1")).value = 'carrera';
    sheetObject.cell(CellIndex.indexByString("f1")).value = alumno['carrera'];

    List<DocumentSnapshot> devices = await FirebaseFirestore.instance
        .collection('alumnos')
        .doc(alumno.id)
        .collection('registros')
        .orderBy('entrada', descending: true)
        .get()
        .then((value) => value.docs)
        .onError((error, stackTrace) {
      print('${error.code}');
      return [];
    });

    for (int i = 0; i < devices.length; i++) {
      sheetObject.cell(CellIndex.indexByString("A${i + 3}")).value =
          date(date: devices[i]['entrada'], format: 'dd MMMM yyyy');
      sheetObject.cell(CellIndex.indexByString("B${i + 3}")).value =
          date(date: devices[i]['entrada'], format: 'hh:mm a');
      sheetObject.cell(CellIndex.indexByString("C${i + 3}")).value =
          date(date: devices[i]['salida'], format: 'hh:mm a');

      final entrada = devices[i]['entrada'].toDate();
      final salida = devices[i]['salida'].toDate();
      final difference = salida.difference(entrada).inHours;

      sheetObject.cell(CellIndex.indexByString("D${i + 3}")).value = difference;
    }

    excel.save(fileName: 'reporte.xlsx');
    // Navigator.pop(context);
  }

  String date({date, format}) {
    return DateFormat(format, 'es').format(date.toDate());
  }
}
