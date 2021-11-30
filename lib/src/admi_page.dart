import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:servicio_social/src/registro.dart';
import 'package:servicio_social/src/generar_reportes.dart';
import 'package:servicio_social/src/backup_page.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class TablaAlumnos extends StatefulWidget {
  @override
  State<TablaAlumnos> createState() => _TablaAlumnosState();
}

class _TablaAlumnosState extends State<TablaAlumnos> {
  SearchBar searchBar;
  bool Archivados = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: Archivados ? 'Ver Archivados' : 'Ver alumnos',
            onPressed: () {
              setState(() {
                Archivados = !Archivados;
              });
            },
            icon: Icon(
              Archivados ? Icons.archive_rounded : Icons.people,
            ),
          ),
          IconButton(
            tooltip: 'Registrar Alumno',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistroPage(),
                  ));
            },
            icon: Icon(
              Icons.person_add_alt_1_rounded,
            ),
          ),
          IconButton(
            tooltip: 'Respaldos',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BackupPage(),
                  ));
            },
            icon: Icon(
              Icons.cloud_upload,
            ),
          ),
          IconButton(
            tooltip: 'Reportes',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportesPage(),
                  ));
            },
            icon: Icon(
              Icons.description,
            ),
          )
        ],
        title: Text('Alumnos haciendo servicio social'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('alumnos')
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
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.arrow_drop_down_circle),
                                title: const Text('Card title 1'),
                                subtitle: Text(
                                  'Secondary Text',
                                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('ACTION 1'),
                                  ),
                                  FlatButton(
                                    textColor: const Color(0xFF6200EE),
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('ACTION 2'),
                                  ),
                                ],
                              ),
                              Image.asset('assets/card-sample-image.jpg'),
                              Image.asset('assets/card-sample-image-2.jpg'),
                            ],
                          ),
                        );
                        //print('Hola $index');
                      },
                      subtitle: Text(
                          '${snapshot.data.docs[index]['nocontrol']} \n ${snapshot.data.docs[index]['escuela']} \n ${date(date: snapshot.data.docs[index]['fechainicio'], format: 'dd  MMMM yyy')}'),
                      title: Text(
                          '${snapshot.data.docs[index]['nombre']} ${snapshot.data.docs[index]['apaterno']} ${snapshot.data.docs[index]['amaterno']}'),
                      trailing: IconButton(
                        tooltip: 'Archivar',
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('alumnos')
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
