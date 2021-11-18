import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';

class Export {
  exportDevices(BuildContext context) async {
    Excel excel = Excel.createExcel();
    Sheet sheetObject;
    sheetObject = excel['Sheet1'];
    List<String> abcs = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
    var titles = [
      'Nombre', //a
      'Departamento', //b
      'Numero', //c
      'Marca', //d
      'Disco', //e
      'RAM', //f
      'Modelo', //g
      'Procesador', //h
    ];
    for (int i = 0; i < titles.length; i++)
      sheetObject.cell(CellIndex.indexByString("${abcs[i]}1")).value =
      titles[i];

    List<DocumentSnapshot> departments = await FirebaseFirestore.instance
        .collection('departments')
        .get()
        .then((value) => value.docs);

    List<DocumentSnapshot> devices = await FirebaseFirestore.instance
        .collection('devices')
        .where('specs_added', isEqualTo: true)
        .get()
        .then((value) => value.docs)
        .onError((error, stackTrace) {
      print('${error.code}');
      return [];
    });

    for (int i = 0; i < devices.length; i++) {
      sheetObject.cell(CellIndex.indexByString("A${i + 2}")).value =
      devices[i]['name'];
      for (var j = 0; j < departments.length; ++j) {
        if (departments[j].id == devices[i]['department']) {
          sheetObject.cell(CellIndex.indexByString("B${i + 2}")).value =
          '${departments[j]['name']} - ${departments[j]['building']} - ${departments[j]['prefix']}';
        }
      }

      sheetObject.cell(CellIndex.indexByString("C${i + 2}")).value =
      devices[i]['number'];
      sheetObject.cell(CellIndex.indexByString("D${i + 2}")).value =
      devices[i]['specs.brand'];
      sheetObject.cell(CellIndex.indexByString("E${i + 2}")).value =
      devices[i]['specs.memory'];
      sheetObject.cell(CellIndex.indexByString("F${i + 2}")).value =
      devices[i]['specs.ram'];
      sheetObject.cell(CellIndex.indexByString("G${i + 2}")).value =
      devices[i]['specs.model'];
      sheetObject.cell(CellIndex.indexByString("H${i + 2}")).value =
      devices[i]['specs.processor'];
    }

    excel.save(
        fileName:
        'reporte.xlsx');
    Navigator.pop(context);
  }
}
