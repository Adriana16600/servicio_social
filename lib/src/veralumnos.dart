import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TablaAlumnos extends StatefulWidget {
  @override
  State<TablaAlumnos> createState() => _TablaAlumnosState();
}

class _TablaAlumnosState extends State<TablaAlumnos> {
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
              Archivados ? Icons.archive_rounded : Icons.reorder_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_add_alt_1_rounded,
            ),
          )
        ],
        title: Text('Data Tables'),
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
                        print('Hello $index');
                      },
                      subtitle: Text(
                          '${snapshot.data.docs[index]['nocontrol']} \n ${snapshot.data.docs[index]['escuela']} \n ${snapshot.data.docs[index]['fechainicio']}'),
                      title: Text(
                          '${snapshot.data.docs[index]['nombre']} ${snapshot.data.docs[index]['apaterno']} ${snapshot.data.docs[index]['amaterno']}'),
                      trailing: IconButton(
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
}
