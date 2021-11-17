import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TablaAlumnos extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Tables'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('alumnos').snapshots(),
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
                        icon: Icon(Icons.delete),
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
