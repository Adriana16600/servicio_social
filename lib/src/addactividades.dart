import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:servicio_social/src/ver_actividades.dart';
import 'package:servicio_social/src/ver_escuelas.dart';

class AddAct extends StatefulWidget {
  final DocumentSnapshot DatosAlumno;
  const AddAct({Key key, this.DatosAlumno}) : super(key: key);

  @override
  _AddActState createState() => _AddActState();
}

class _AddActState extends State<AddAct> {

  static const menuItems = <String>[
    'Centro de Cómputo',
    'Biblioteca',
    'Otro',
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();
  String _btn1SelectedVal = 'Centro de Cómputo';
  String _btn2SelectedVal;
  String _btn3SelectedVal;

  String area = '',
      act1 = '',
      act2='',
      act3='',
  act4='';
  bool activo=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar actividad por Área'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
                child: Text(
                  'Llene el formulario para registrar el tipo de actividades que se desarrollará por área',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListTile(
              title: const Text('Área de servicio social'),
              trailing: DropdownButton(
                value: _btn2SelectedVal,
                hint: const Text('Elegir'),
                onChanged: (String newValue) {
                  setState(() {
                    _btn2SelectedVal = newValue;
                    area = newValue;
                  });
                },
                items: _dropDownMenuItems,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              maxLength: 10,
              //controller: act1C,
              onChanged: (value) {
                setState(() {
                  act1 = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Actividad a desarrollar',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              maxLength: 10,
              //controller: act1C,
              onChanged: (value) {
                setState(() {
                  act2 = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Actividad a desarrollar',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              maxLength: 10,
              //controller: act1C,
              onChanged: (value) {
                setState(() {
                  act3 = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Actividad a desarrollar',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              maxLength: 10,
              //controller: act1C,
              onChanged: (value) {
                setState(() {
                  act4 = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Actividad a desarrollar',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          //Container(
          //width: 60,
          //margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text('Agregar'),
                onPressed: () {
                  FirebaseFirestore.instance.collection('actividades').doc().set({
                    'area': area,
                    'act1': act1,
                    'act2': act2,
                    'act3': act3,
                    'act4': act4,
                    'activo': activo
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal:100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerActividades(),
                        ));
                  },
                  child: Text('Ver lista de actividades')),
            ],
          )
          //)
        ],
      ),
    );
  }
}