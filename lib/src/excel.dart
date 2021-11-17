import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ss_admin/src/modules/navigation/navigation_model.dart';

class ExportPage extends StatefulWidget {
  @override
  _ExportPageState createState() => _ExportPageState();
}

class _ExportPageState extends State<ExportPage> {
  bool done = false;
  var excel = Excel.createExcel();
  List<dynamic> elements = [];
  Sheet sheetObject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Exportar a EXCEL', style: Theme.of(context).textTheme.headline5),
            Icon(
              Icons.cloud_download_rounded,
              size: 150,
              color: Theme.of(context).colorScheme.primary.withOpacity(.5),
            ),
            Text('Este proceso puede tomar de 2-3 minutos',
                style: Theme.of(context).textTheme.bodyText2),
            Container(
              width: 500,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton.icon(
                  onPressed: !done
                      ? () {
                    showLoaderDialog(context);
                    print('Working...');
                    sheetObject = excel['Sheet1'];
                    var abcs = [
                      'a',
                      'b',
                      'c',
                      'd',
                      'e',
                      'f',
                      'g',
                      'h',
                      'i',
                      'j',
                      'k',
                      'l',
                      'm',
                      'n',
                      'o',
                      'p',
                      'q',
                      'r',
                      's',
                      't',
                      'u',
                      'v',
                      'w',
                      'x',
                      'y',
                      'z'
                    ];
                    var titles = [
                      'folio',
                      'nombre del participante',
                      'contacto',
                      'ciudad',
                      'entidad',
                      'estado boleto',
                      'metodo de pago',
                      'numero tarjeta',
                      'fecha apartado',
                      'fecha venta',
                    ];
                    for (int i = 0; i < titles.length; i++) {
                      sheetObject
                          .cell(CellIndex.indexByString("${abcs[i]}1"))
                          .value = titles[i];
                    }

                    FirebaseFirestore.instance
                        .collection('raffles')
                        .doc(Provider.of<NavigationModel>(context, listen: false).activeRaffle)
                        .collection('tickets')
                        .where('number', isLessThanOrEqualTo: 9999)
                    // .orderBy('number', descending: false)
                        .get()
                        .then((value) {
                      elements = value.docs;
                      print('done!!!!');
                      print('Items count: ${value.docs.length}');
                      setState(() {
                        done = true;
                      });
                      Navigator.pop(context);
                    });
                  }
                      : null,
                  icon: Icon(Icons.cloud_done_rounded),
                  label: Text('Preparar información')),
            ),
            Container(
              width: 500,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton.icon(
                  onPressed: done
                      ? () {
                    showLoaderDialog(context);
                    int actualTicketsIndex = 0;
                    for (int i = 0; i < elements.length; i++) {
                      if (actualTicketsIndex < 10000 - 1) {
                        if (elements[actualTicketsIndex]['number'] == i) {
                          addToSheet(elements: elements[i], index: i);
                          actualTicketsIndex++;
                          if (elements[actualTicketsIndex]['number'] ==
                              i) {
                            i--;
                          }
                        } else {
                          addToSheetEmpty(index: i);
                        }
                      } else {
                        addToSheetEmpty(index: i);
                      }
                      print(i);
                    }
                    excel.save(
                        fileName:
                        'boletos ${DateFormat('dd-MMMM-yyyy H m', 'es-MX').format(DateTime.now())}.xlsx');
                    setState(() {
                      done = false;
                    });
                    Navigator.pop(context);
                  }
                      : null,
                  icon: Icon(Icons.arrow_circle_down_rounded),
                  label: Text('Generar y descargar Excel')),
            )
          ],
        ),
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Cargando...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void addToSheet({DocumentSnapshot elements, int index}) {
    sheetObject.cell(CellIndex.indexByString("A${index + 2}")).value =
        num(elements.data()['number']);
    sheetObject.cell(CellIndex.indexByString("B${index + 2}")).value =
    elements.data()['owner']['name'];
    sheetObject.cell(CellIndex.indexByString("C${index + 2}")).value =
    elements.data()['owner']['phone_number'];
    sheetObject.cell(CellIndex.indexByString("D${index + 2}")).value =
    elements.data()['owner']['city'];
    sheetObject.cell(CellIndex.indexByString("E${index + 2}")).value =
    elements.data()['owner']['state'];
    if (elements.data()['sold_time'] != null) {
      sheetObject.cell(CellIndex.indexByString("F${index + 2}")).value =
      'VENIDO';
    } else {
      sheetObject.cell(CellIndex.indexByString("F${index + 2}")).value =
      'APARTADO';
    }

    if (elements.data()['payment'] != null) {
      sheetObject.cell(CellIndex.indexByString("g${index + 2}")).value =
      elements.data()['payment']['type'];
      //card_4digits
      sheetObject.cell(CellIndex.indexByString("h${index + 2}")).value =
      elements.data()['payment']['card_4digits'];
    }
    sheetObject.cell(CellIndex.indexByString("i${index + 2}")).value =
        DateFormat('dd MMMM yyyy, H:m', 'es-MX')
            .format(elements.data()['apart_time'].toDate());
    if (elements.data()['sold_time'] != null) {
      sheetObject.cell(CellIndex.indexByString("j${index + 2}")).value =
          DateFormat('dd MMMM yyyy, H:m', 'es-MX')
              .format(elements.data()['sold_time'].toDate());
    }
  }

  void addToSheetEmpty({int index}) {
    sheetObject.cell(CellIndex.indexByString("A${index + 2}")).value =
        num(index);
    sheetObject.cell(CellIndex.indexByString("B${index + 2}")).value = '';
    sheetObject.cell(CellIndex.indexByString("C${index + 2}")).value = '';
    sheetObject.cell(CellIndex.indexByString("D${index + 2}")).value = '';
    sheetObject.cell(CellIndex.indexByString("E${index + 2}")).value = '';
    sheetObject.cell(CellIndex.indexByString("F${index + 2}")).value =
    'DISPONIBLE';
    sheetObject.cell(CellIndex.indexByString("i${index + 2}")).value = '';
  }

  String num(int index) {
    return index < 10
        ? '000$index'
        : index < 100
        ? '00$index'
        : index < 1000
        ? '0$index'
        : '$index';
  }
}
