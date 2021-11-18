import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'excel.dart';

class HistoryPage extends StatelessWidget {
  final DocumentSnapshot alumno;

  const HistoryPage({Key key, @required this.alumno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Historial de horas'),
          actions: [
            IconButton(
              onPressed: () {
                Export().exportarHistorialAlumno(context, alumno);
              },
              icon: Icon(
                Icons.get_app_rounded,
              ),
            ),
          ],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('alumnos')
                .doc(alumno.id)
                .collection('registros')
                .orderBy('entrada', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data.docs[index];
                  return ListTile(
                    title: Text(
                        '${date(date: doc['entrada'], format: 'EEEE')}, ${date(date: doc['entrada'], format: 'dd')} de ${date(date: doc['entrada'], format: 'MMMM')} del ${date(date: doc['entrada'], format: 'yyyy')}'),
                    subtitle: Text(
                        'Entrada: ${date(format: 'hh:mm a', date: doc['entrada'])} - Salida ${date(format: 'hh:mm a', date: doc['salida'])}'),
                  trailing: Text('Total hrs: ${doc['total_hrs']}'),
                  );
                },
              );
            }));
  }

  String date({date, format}) {
    return DateFormat(format, 'es').format(date.toDate());
  }
}
