import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ExportActi {
  exportarActi(BuildContext context, String nombre,String servicio, String carrera, String nocontrol) async {
    Excel excel = Excel.createExcel();
    Sheet sheetObject;
    sheetObject = excel['Sheet1'];

    if(servicio=='Centro de cómputo'){
      sheetObject.cell(CellIndex.indexByString("e1")).value = 'Agua Prieta, Sonora';//this.date(date: 'dd MM yyy');
      sheetObject.cell(CellIndex.indexByString("f1")).value = '=HOY()';
      sheetObject.cell(CellIndex.indexByString("e2")).value = 'OFICIO No. CC/031/2021';
      sheetObject.cell(CellIndex.indexByString("e3")).value = 'ASUNTO: Carta de terminación de Servicio Social';
      sheetObject.cell(CellIndex.indexByString("a4")).value ='M.C. ANA MÉNDEZ ZAZUETA';
      sheetObject.cell(CellIndex.indexByString("f5")).value = 'AT’N: M.A. EDGARCOTA VALENZUELA';
      sheetObject.cell(CellIndex.indexByString("f6")).value = 'JEFE DEL DEPARTAMENTO DE ';
      sheetObject.cell(CellIndex.indexByString("f7")).value = 'GESTIÓN TECNOLÓGICA Y VINCULACIÓN';
      sheetObject.cell(CellIndex.indexByString("a8")).value = 'Por medio de la presente me permito informarle que el C. $nombre';
      sheetObject.cell(CellIndex.indexByString("a9")).value = 'estudiante de la carrera de $carrera con número de control $nocontrol, realizará las';
      sheetObject.cell(CellIndex.indexByString("a10")).value = 'siguientes actividades de Servicio Social en el departamento de $servicio.';
      sheetObject.cell(CellIndex.indexByString("a11")).value = '1.Mantenimiento a equipos de cómputo';
      sheetObject.cell(CellIndex.indexByString("a12")).value = '2.Instalación de Software a Computadoras.';
      sheetObject.cell(CellIndex.indexByString("a13")).value = '3.Instalación de cableado de red.';
      sheetObject.cell(CellIndex.indexByString("a14")).value = '4.Control de acceso a los laboratorios del Centro de Cómputo.';
      sheetObject.cell(CellIndex.indexByString("a15")).value = '';
      sheetObject.cell(CellIndex.indexByString("a16")).value = 'Sin otro particular por el momento, aprovecho la ocación para enviarle un cordial saludo.';
      sheetObject.cell(CellIndex.indexByString("a17")).value = '';
      sheetObject.cell(CellIndex.indexByString("a18")).value = 'ATENTAMENTE';
      sheetObject.cell(CellIndex.indexByString("a19")).value = 'Excelencia en Educación Tecnológia';
      sheetObject.cell(CellIndex.indexByString("a20")).value = 'La Fuerza del Conocimiento a la Liberación del Espíritu';
      sheetObject.cell(CellIndex.indexByString("a21")).value = '';
      sheetObject.cell(CellIndex.indexByString("a22")).value = '';
      sheetObject.cell(CellIndex.indexByString("a23")).value = 'LIC. ELIZABETH SANTILLÁN TARAZÓN';
      sheetObject.cell(CellIndex.indexByString("a24")).value = 'JEFA DE CENTRO DE CÓMPUTO';

      excel.save(fileName: 'Carta de terminación.xlsx');
    }
    if(servicio=='Biblioteca'){
      sheetObject.cell(CellIndex.indexByString("e1")).value = 'Agua Prieta, Sonora';//this.date(date: 'dd MM yyy');
      sheetObject.cell(CellIndex.indexByString("f1")).value = '=HOY()';
      sheetObject.cell(CellIndex.indexByString("e2")).value = 'OFICIO No. CC/031/2021';
      sheetObject.cell(CellIndex.indexByString("e3")).value = 'ASUNTO: Carta de terminación de Servicio Social';
      sheetObject.cell(CellIndex.indexByString("a4")).value ='M.C. ANA MÉNDEZ ZAZUETA';
      sheetObject.cell(CellIndex.indexByString("f5")).value = 'AT’N: M.A. EDGARCOTA VALENZUELA';
      sheetObject.cell(CellIndex.indexByString("f6")).value = 'JEFE DEL DEPARTAMENTO DE ';
      sheetObject.cell(CellIndex.indexByString("f7")).value = 'GESTIÓN TECNOLÓGICA Y VINCULACIÓN';
      sheetObject.cell(CellIndex.indexByString("a8")).value = 'Por medio de la presente me permito informarle que el C. $nombre';
      sheetObject.cell(CellIndex.indexByString("a9")).value = 'estudiante de la carrera de $carrera con número de control $nocontrol, realizará las';
      sheetObject.cell(CellIndex.indexByString("a10")).value = 'siguientes actividades de Servicio Social en el departamento de $servicio.';
      sheetObject.cell(CellIndex.indexByString("a11")).value = '1.Organización de libros.';
      sheetObject.cell(CellIndex.indexByString("a12")).value = '2.Préstamos de libros, computadoras, cubículos y salón.';
      sheetObject.cell(CellIndex.indexByString("a13")).value = '3.Limpieza.';
      sheetObject.cell(CellIndex.indexByString("a14")).value = '4.Control de acceso a la biblioteca.';
      sheetObject.cell(CellIndex.indexByString("a15")).value = '';
      sheetObject.cell(CellIndex.indexByString("a16")).value = 'Sin otro particular por el momento, aprovecho la ocación para enviarle un cordial saludo.';
      sheetObject.cell(CellIndex.indexByString("a17")).value = '';
      sheetObject.cell(CellIndex.indexByString("a18")).value = 'ATENTAMENTE';
      sheetObject.cell(CellIndex.indexByString("a19")).value = 'Excelencia en Educación Tecnológia';
      sheetObject.cell(CellIndex.indexByString("a20")).value = 'La Fuerza del Conocimiento a la Liberación del Espíritu';
      sheetObject.cell(CellIndex.indexByString("a21")).value = '';
      sheetObject.cell(CellIndex.indexByString("a22")).value = '';
      sheetObject.cell(CellIndex.indexByString("a23")).value = 'LIC. ELIZABETH SANTILLÁN TARAZÓN';
      sheetObject.cell(CellIndex.indexByString("a24")).value = 'JEFA DE CENTRO DE CÓMPUTO';



      excel.save(fileName: 'Plan de actividades.xlsx');
    }

  }



  String date({date, format}) {
    return DateFormat(format, 'es').format(date.toDate());

  }
}