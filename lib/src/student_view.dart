import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'hours_history.dart';

class StudentPage extends StatelessWidget {
  final DocumentSnapshot alumno;

  const StudentPage({Key key, @required this.alumno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola ${alumno['nombre']}'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryPage(alumno: alumno,),
                  ));
            },
            icon: Icon(
              Icons.history_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
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
              .limit(1)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            if (!(snapshot.data.docs[0]['activo'])) {
              return Center(
                child: HugeButton(
                  color: Theme.of(context).colorScheme.primary,
                  icon: Icons.play_circle_outline_rounded,
                  text: 'Empezar',
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('alumnos')
                        .doc(alumno.id)
                        .collection('registros')
                        .doc()
                        .set({'activo': true, 'entrada': Timestamp.now()});
                  },
                ),
              );
            } else {
              return Center(
                child: HugeButton(
                  color: Theme.of(context).colorScheme.error,
                  icon: Icons.do_disturb_rounded,
                  text: 'Terminar',
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('alumnos')
                        .doc(alumno.id)
                        .collection('registros')
                        .doc(snapshot.data.docs[0].id)
                        .update({'activo': false, 'salida': Timestamp.now()});
                  },
                ),
              );
            }
          }),
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
