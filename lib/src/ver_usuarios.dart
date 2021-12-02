import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:servicio_social/src/registro.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'addescuela.dart';
import 'addusuarios.dart';

class VerUsuarios extends StatefulWidget {
  const VerUsuarios({Key key}) : super(key: key);

  @override
  State<VerUsuarios> createState() => _VerUsuariosState();
}

class _VerUsuariosState extends State<VerUsuarios> {
  SearchBar searchBar;
  bool Archivados = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: Archivados ? 'Ver Archivados' : 'Ver usuarios',
            onPressed: () {
              setState(() {
                Archivados = !Archivados;
              });
            },
            icon: Icon(
              Archivados ? Icons.archive_rounded : Icons.admin_panel_settings,
            ),
          ),
        ],
        title: Text('Usuarios'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('usuarios')
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
                          'Usuario: ${snapshot.data.docs[index]['usuario']}\nNIP: ${snapshot.data.docs[index]['nip']}'),
                      title: Text(
                          '${snapshot.data.docs[index]['nombre']}'),
                      trailing: IconButton(
                        tooltip: 'Archivar',
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('usuarios')
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
