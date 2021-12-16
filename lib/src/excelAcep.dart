import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ExportAcept {
  exportarAceptAlumnos(BuildContext context, DocumentSnapshot alumnot) async {
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
    ];
    for (int i = 0; i < titles.length; i++) {
      sheetObject.cell(CellIndex.indexByString("${abcs[i]}2")).value =
      titles[i];
    }

    sheetObject.cell(CellIndex.indexByString("e1")).value = 'Agua Prieta, Sonora';//this.date(date: 'dd MM yyy');
    sheetObject.cell(CellIndex.indexByString("f1")).value = '=HOY()';
    sheetObject.cell(CellIndex.indexByString("e2")).value = 'OFICIO No. CC/031/2021';
    sheetObject.cell(CellIndex.indexByString("e3")).value = 'ASUNTO: Carta de terminación de Servicio Social';
    sheetObject.cell(CellIndex.indexByString("a4")).value ='M.C. ANA MÉNDEZ ZAZUETA';
    sheetObject.cell(CellIndex.indexByString("f5")).value = 'AT’N: M.A. EDGARCOTA VALENZUELA';
    sheetObject.cell(CellIndex.indexByString("f6")).value = 'JEFE DEL DEPARTAMENTO DE ';
    sheetObject.cell(CellIndex.indexByString("f7")).value = 'GESTIÓN TECNOLÓGICA Y VINCULACIÓN';
    sheetObject.cell(CellIndex.indexByString("a8")).value = 'Por medio de la presente me permito informarle que el C.';

    /*List<DocumentSnapshot> devices = await FirebaseFirestore.instance
        .collection('alumnos')
        .doc(alumnot.id)
        .collection('registros')
        .orderBy('nombre', descending: true)
        .get()
        .then((value) => value.docs)
        .onError((error, stackTrace) {
      print('${error.code}');
      return [];
    });*/


    excel.save(fileName: 'Carta de aceptación.xlsx');
    // Navigator.pop(context);
  }



  String date({date, format}) {
    return DateFormat(format, 'es').format(date.toDate());

  }
}