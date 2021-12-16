import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:servicio_social/src/addactividades.dart';
import 'package:servicio_social/src/addescuela.dart';
import 'package:servicio_social/src/addusuarios.dart';
import 'package:servicio_social/src/cargamasiva.dart';
import 'package:servicio_social/src/registro.dart';
import 'package:servicio_social/src/generar_reportes.dart';
import 'package:servicio_social/src/backup_page.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class TablaAlumnos extends StatefulWidget {
  //final DocumentSnapshot admi;

  const TablaAlumnos({
    Key key,
  }) : super(key: key);

  //const TablaAlumnos({Key key, @required this.admi}) : super(key: key);

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
            tooltip: 'Carga masiva',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Masiva(),
                  ));
            },
            icon: Icon(
              Icons.group_add,
            ),
          ),
          IconButton(
            tooltip: 'Actividades',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAct(),
                  ));
            },
            icon: Icon(
              Icons.pending_actions,
            ),
          ),
          IconButton(
            tooltip: 'Agregar Escuela',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEscuela(),
                  ));
            },
            icon: Icon(
              Icons.school,
            ),
          ),
          IconButton(
            tooltip: 'Agregar Usuarios',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddUsuarios(),
                  ));
            },
            icon: Icon(
              Icons.admin_panel_settings,
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
        title: Archivados
            ? Text('Alumnos haciendo servicio social')
            : Text('Alumnos que ha finalizado el servicio social'),
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
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(

                              title: Text(
                                  '${snapshot.data.docs[index]['nombre']} ${snapshot.data.docs[index]['apaterno']} ${snapshot.data.docs[index]['amaterno']}'),
                              content: FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection('alumnos')
                                      .doc(snapshot.data.docs[index].id)
                                      .collection('registros')
                                      .get(),
                                  builder: (context, todo) {
                                    for(int i = 0; i<todo.data.docs.lenght;i++){

                                    }
                                  return Text(
                                      '${snapshot.data.docs[index]['nocontrol']}\n${snapshot.data.docs[index]['escuela']}\n${snapshot.data.docs[index]['carrera']}\nSemestre ${snapshot.data.docs[index]['semestre']}\nTeléfono: ${snapshot.data.docs[index]['telefono']}\nÁrea: ${snapshot.data.docs[index]['servicio']}\nFecha de inicio: ${date(date: snapshot.data.docs[index]['fechainicio'], format: 'dd  MMMM yyy')}\nHoras totales: ${snapshot.data.docs[index]['hrstotales']} \nHoras acumuladas:');
                                }
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                //DatosAlumno: snapshot.data.docs[index],
                                                RegistroPage(),
                                          ));
                                    },
                                    child: Text('Editar'))
                              ],
                            );
                          },
                        );
                        //print('Hola $index');
                      },
                      subtitle: FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('alumnos')
                              .doc(snapshot.data.docs[index].id)
                              .collection('registros')
                              .get(),
                          builder: (context, todo) {
                            return Text(
                                '${snapshot.data.docs[index]['nocontrol']} \n ${snapshot.data.docs[index]['escuela']} \n ${date(date: snapshot.data.docs[index]['fechainicio'], format: 'dd  MMMM yyy')}');
                          }),
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
