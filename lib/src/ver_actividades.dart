import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:servicio_social/src/registro.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'addescuela.dart';
import 'addusuarios.dart';

class VerActividades extends StatefulWidget {
  const VerActividades({Key key}) : super(key: key);

  @override
  State<VerActividades> createState() => _VerActividadesState();
}

class _VerActividadesState extends State<VerActividades> {
  SearchBar searchBar;
  bool Archivados = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: Archivados ? 'Ver Archivados' : 'Ver Actividades',
            onPressed: () {
              setState(() {
                Archivados = !Archivados;
              });
            },
            icon: Icon(
              Archivados ? Icons.archive_rounded : Icons.pending_actions,
            ),
          ),
        ],
        title: Text('Actividades'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('actividades')
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
                        print('Hola $index');
                      },
                      subtitle: Text(
                          '1. ${snapshot.data.docs[index]['act1']}\n2. ${snapshot.data.docs[index]['act2']}\n3. ${snapshot.data.docs[index]['act3']}\n4. ${snapshot.data.docs[index]['act4']}'),
                      title: Text(
                          '${snapshot.data.docs[index]['area']}'),
                      trailing: IconButton(
                        tooltip: 'Archivar',
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('actividades')
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
