import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:servicio_social/src/registro.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'addescuela.dart';
import 'addusuarios.dart';

class VerEscuelas extends StatefulWidget {
  const VerEscuelas({Key key}) : super(key: key);

  @override
  State<VerEscuelas> createState() => _VerEscuelasState();
}

class _VerEscuelasState extends State<VerEscuelas> {
  SearchBar searchBar;
  bool Archivados = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: Archivados ? 'Ver Archivados' : 'Ver escuelas',
            onPressed: () {
              setState(() {
                Archivados = !Archivados;
              });
            },
            icon: Icon(
              Archivados ? Icons.archive_rounded : Icons.school,
            ),
          ),
        ],
        title: Text('Escuelas'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('escuelas')
              .where('activo', isEqualTo: Archivados)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();

            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  'Atención'),
                              content: FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection('escuelas')
                                      .doc(snapshot.data.docs[index].id)
                                      .get(),
                                  builder: (context, todo) {
                                    if (!todo.hasData) return Text('...');
                                    return Text(
                                        '¿Quiere editar ${snapshot.data.docs[index]['escuelaname']}?');
                                  }),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                //DatosAlumno: snapshot.data.docs[index],
                                                AddEscuela(),
                                          ));
                                    },
                                    child: Text('Editar'))
                              ],
                            );
                          },
                        );
                        //print('Hola $index');
                      },
                      subtitle: Text(
                          'Dirección: ${snapshot.data.docs[index]['direccion']}\nTeléfono: ${snapshot.data.docs[index]['telefono']}\nHoras de Servicio Social: ${snapshot.data.docs[index]['horas']}'),
                      title:
                          Text('${snapshot.data.docs[index]['escuelaname']}'),
                      trailing: IconButton(
                        tooltip: 'Archivar',
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('escuelas')
                              .doc(snapshot.data.docs[index].id)
                              .update({
                            'activo': !(snapshot.data.docs[index]['activo'])
                          });
                        },
                        icon: Icon(Archivados
                            ? Icons.archive_rounded
                            : Icons.unarchive_rounded),
                      ),
                    ),
                    Divider()
                  ],
                );
              },
            );
          }),
    );
  }

  String date({date, format}) {
    return DateFormat(format, 'es').format(date.toDate());
  }
}
