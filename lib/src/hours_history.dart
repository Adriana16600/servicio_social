import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  final DocumentSnapshot alumno;

  const HistoryPage({Key key, @required this.alumno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Historial de horas'),
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
                  return ListTile(
                    title: Text(
                        '${DateFormat('dd-MM-yyyy').format(snapshot.data.docs[index]['entrada'].toDate())}'),
                    subtitle: Text('Entrada: ${DateFormat('hh:mm a').format(snapshot.data.docs[index]['entrada'].toDate())},'
                        ' Salida ${DateFormat('hh:mm a').format(snapshot.data.docs[index]['salida'].toDate())}'),
                  );
                },
              );
            }));
  }
}
