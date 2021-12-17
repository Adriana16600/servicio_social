import 'dart:typed_data';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:servicio_social/src/admi_page.dart';
import 'package:servicio_social/src/excel.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:servicio_social/src/excel_acep.dart';
import 'package:servicio_social/src/excel_act.dart';
import 'package:servicio_social/src/excel_term.dart';
import 'excel.dart';
import 'package:firebase_database/firebase_database.dart';

class ReportesPage extends StatefulWidget {
  const ReportesPage({
    Key key,
  }) : super(key: key);

  @override
  State<ReportesPage> createState() => _ReportesPageState();
}

class _ReportesPageState extends State<ReportesPage> {
  String control = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generar reportes'),
        actions: [],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
            child: Text(
              'Ingrese el número de control del alumno, NOTA: Si no lo ingresa no podrá descargar el documento',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              //controller: act1C,
              onChanged: (value) {
                setState(() {
                  control = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Número de control del alumno',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Row(
            children: [
              HugeButton(
                  color: Theme.of(context).colorScheme.primary,
                  icon: Icons.import_contacts,
                  text: 'Carta de aceptación',
                  onTap: () async {
                    FirebaseFirestore.instance
                        .collection('alumnos')
                        .where('nocontrol', isEqualTo: control)
                        .get()
                        .then((value) {
                      if (value.size != 0) {
                        ExportAcept().exportarAceptAlumnos(
                            context,
                            '${value.docs[0]['nombre']} ${value.docs[0]['apaterno']} ${value.docs[0]['amaterno']}',
                            '${value.docs[0]['nocontrol']}',
                            '${value.docs[0]['carrera']}',
                            '${value.docs[0]['servicio']}',
                            '${value.docs[0]['fechainicio']}',
                            '${value.docs[0]['hrstotales']}');
                      }
                    });
                    /*await launch(
                  url,
                  forceSafariVC: false,
                  forceWebView: false,
                  headers: <String, String>{'my_header_key': 'my_header_value'},
                )*/
                    /*final pdf = pw.Document();
                Uint8List fontData = File('ProximaNova-Black.ttf').readAsBytesSync();
                var data = fontData.buffer.asByteData();
                pdf.addPage(
                  pw.Page(
                    build: (pw.Context context) => pw.Center(
                      child: pw.Text('Hello World', style: pw.TextStyle(font: pw.Font.ttf(data),fontSize: 42,fontWeight: pw.FontWeight.bold)),
                    ),
                  ),
                );
                pdf.save().then((value){
                  final blob = html.Blob([value], 'application/pdf');
                  final url = html.Url.createObjectUrlFromBlob(blob);
                  final anchor = html.document.createElement('a') as html.AnchorElement
                    ..href = url
                    ..style.display = 'none'
                    ..download = 'pdf.pdf';
                  html.document.body.children.add(anchor);

                });*/
                  }),
              HugeButton(
                  color: Theme.of(context).colorScheme.primary,
                  icon: Icons.menu_book,
                  text: 'Carta de terminación',
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('alumnos')
                        .where('nocontrol', isEqualTo: control)
                        .get()
                        .then((value) {
                      if (value.size != 0) {
                        ExportTerminacion().exportarTerminacionAlumnos(
                            context,
                            '${value.docs[0]['nombre']} ${value.docs[0]['apaterno']} ${value.docs[0]['amaterno']}',
                            '${value.docs[0]['servicio']}');
                      }
                    });
                  }),
              HugeButton(
                  color: Theme.of(context).colorScheme.primary,
                  icon: Icons.pending_actions,
                  text: 'Reporte de actividades',
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('alumnos')
                        .where('nocontrol', isEqualTo: control)
                        .get()
                        .then((value) {
                      if (value.size != 0) {
                        ExportActi().exportarActi(
                            context,
                            '${value.docs[0]['nombre']} ${value.docs[0]['apaterno']} ${value.docs[0]['amaterno']}',
                            '${value.docs[0]['servicio']}','${value.docs[0]['carrera']}','${value.docs[0]['nocontrol']}');
                      }
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}

class HugeButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function onTap;

  const HugeButton({
    Key key,
    @required this.color,
    @required this.text,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(1000),
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(1000)),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 200,
            ),
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }
}
