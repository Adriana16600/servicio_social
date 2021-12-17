import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ExportAcept {
  exportarAceptAlumnos(BuildContext context, String nombre, String nocontrol, String carrera, String servicio, String fechainicio, String horas) async {
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
    sheetObject.cell(CellIndex.indexByString("e3")).value = 'ASUNTO: ACEPTACIÓN DEL SERVICIO SOCIAL';
    sheetObject.cell(CellIndex.indexByString("a4")).value ='M.C. ANA MÉNDEZ ZAZUETA';
    sheetObject.cell(CellIndex.indexByString("a5")).value = 'DIRECTORA';
    sheetObject.cell(CellIndex.indexByString("a6")).value = 'INSTITUTO TECNOLOGICO DE AGUA PRIETA';
    sheetObject.cell(CellIndex.indexByString("a7")).value = 'PRESENTE';
    sheetObject.cell(CellIndex.indexByString("f8")).value = 'M.A. EDGAR COTA VALENZUELA';
    sheetObject.cell(CellIndex.indexByString("f9")).value = 'JEFE DEL DEPARTAMENTO DE ';
    sheetObject.cell(CellIndex.indexByString("f10")).value = 'GESTIÓN TECNOLÓGICA Y VINCULACIÓN';
    sheetObject.cell(CellIndex.indexByString("a11")).value = 'Por medio de la presente me permito informarle que el C.$nombre';
    sheetObject.cell(CellIndex.indexByString("a12")).value = 'de la carrera de $carrera, con número de control $nocontrol, fue aceptado';
    sheetObject.cell(CellIndex.indexByString("a13")).value = '(a) para realizar su Servicio Social en $servicio, donde cubrirá un total de $horas a partir del';
    sheetObject.cell(CellIndex.indexByString("a14")).value = 'día $fechainicio laborando un total de 5 horas diarias, en un lapso mínimo de 6 meses, no excediéndose';
    sheetObject.cell(CellIndex.indexByString("a15")).value = 'de dos años';
    sheetObject.cell(CellIndex.indexByString("a16")).value = '';
    sheetObject.cell(CellIndex.indexByString("a17")).value = 'Sin otro particular por el momento, aprovecho la ocación para enviarle un cordial saludo.';
    sheetObject.cell(CellIndex.indexByString("a18")).value = '';
    sheetObject.cell(CellIndex.indexByString("a19")).value = 'ATENTAMENTE';
    sheetObject.cell(CellIndex.indexByString("a20")).value = 'Excelencia en Educación Tecnológia';
    sheetObject.cell(CellIndex.indexByString("a21")).value = 'La Fuerza del Conocimiento a la Liberación del Espíritu';
    sheetObject.cell(CellIndex.indexByString("a22")).value = '';
    sheetObject.cell(CellIndex.indexByString("a23")).value = 'LIC. ELIZABETH SANTILLÁN TARAZÓN';
    sheetObject.cell(CellIndex.indexByString("a24")).value = 'JEFA DE CENTRO DE CÓMPUTO';

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