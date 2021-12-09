import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servicio_social/src/excel.dart';
import 'package:firebase_backup_restore/results.dart';
import 'package:firebase_backup_restore/firebase_backup_restore.dart';

class BackupPage extends StatefulWidget {
  const BackupPage({Key key}) : super(key: key);

  @override
  _BackupPageState createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  /*void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
    FirebaseBackupRestore().collections = ['alumnos', 'usuarios','horas',];
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Respaldo y recuperación'),
        actions: [
        ],
      ),
      body: Row(
        children: [
          HugeButton(
              color: Theme.of(context).colorScheme.primary,
              icon: Icons.cloud_upload,
              text: 'Crear copia de la base de datos',
              onTap: () async {
                await FirebaseBackupRestore().backupAll();
              }),
          HugeButton(
              color: Theme.of(context).colorScheme.primary,
              icon: Icons.cloud_download,
              text: 'Recuperar base de datos',
              onTap: () async {
                await FirebaseBackupRestore().restoreAll();
              })
        ],
      ),
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
