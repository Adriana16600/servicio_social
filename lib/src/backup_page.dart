import 'package:cloud_firestore/cloud_firestore.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
        ],
        title: Text('Respaldo y Recuperación de la Base de datos'),
      ),
    );
  }
}
