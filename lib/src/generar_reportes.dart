import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servicio_social/src/admi_page.dart';
import 'package:servicio_social/src/excel.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReportesPage extends StatefulWidget {
  const ReportesPage({Key key}) : super(key: key);

  @override
  _ReportesPageState createState() => _ReportesPageState();
}

class _ReportesPageState extends State<ReportesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generar reportes'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TablaAlumnos(),
                  ));
            },
            icon: Icon(
              Icons.history_rounded,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          HugeButton(
              color: Theme.of(context).colorScheme.primary,
              icon: Icons.import_contacts,
              text: 'Carta de aceptación',
              onTap: () {
                final pdf = pw.Document();

                pdf.addPage(pw.Page(
                    pageFormat: PdfPageFormat.a4,
                    build: (pw.Context context) {
                      return pw.Center(
                        child: pw.Text("Carta aceptación"),
                      ); // Center
                    })); // Page
              }),
          HugeButton(
              color: Theme.of(context).colorScheme.primary,
              icon: Icons.menu_book,
              text: 'Carta de terminación',
              onTap: () {})
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
