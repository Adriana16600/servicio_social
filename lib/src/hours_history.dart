import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Historial de horas'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('Martes 16 de octubre'),
              subtitle: Text('Entrada: 5:00pm, Salida 7:00pm'),
            )
          ],
        ));
  }
}
