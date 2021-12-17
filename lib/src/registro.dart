import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  final DocumentSnapshot DatosAlumno;

  const RegistroPage({Key key, this.DatosAlumno}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  TextEditingController numcontrolC;
  TextEditingController nombreC;
  TextEditingController apaternoC;
  TextEditingController amaternoC;
  TextEditingController escuelaC;
  TextEditingController carreraC;
  TextEditingController semestreC;
  TextEditingController hrstotalesC;
  TextEditingController telefonoC;
  TextEditingController servicioC;
  TextEditingController fechainicioC;

  String numcontrol = '',
      nombre = '',
      apaterno = '',
      amaterno = '',
      escuela = '',
      carrera = '',
      semestre = '',
      hrstotales = '',
      telefono = '',
      servicio = '';
  Timestamp fechainicio;
  bool activo = true;

  @override
  void initState() {
    if (widget.DatosAlumno != null) {
      numcontrolC.text = widget.DatosAlumno['nocontrol'];
      nombreC.text = widget.DatosAlumno['nombre'];
      apaternoC.text = widget.DatosAlumno['apaterno'];
      amaternoC.text = widget.DatosAlumno['amaterno'];
      escuelaC.text = widget.DatosAlumno['escuela'];
      carreraC.text = widget.DatosAlumno['carrera'];
      semestreC.text = widget.DatosAlumno['semestre'];
      hrstotalesC.text = widget.DatosAlumno['hrstotales'];
      telefonoC.text = widget.DatosAlumno['telefono'];
      servicioC.text = widget.DatosAlumno['servicio'];
      fechainicioC.text = widget.DatosAlumno['fechainicio'];

      numcontrol = widget.DatosAlumno['nocontrol'];
      nombre = widget.DatosAlumno['nombre'];
      apaterno = widget.DatosAlumno['apaterno'];
      amaterno = widget.DatosAlumno['amaterno'];
      escuela = widget.DatosAlumno['escuela'];
      carrera = widget.DatosAlumno['carrera'];
      semestre = widget.DatosAlumno['semestre'];
      hrstotales = widget.DatosAlumno['hrstotales'];
      telefono = widget.DatosAlumno['telefono'];
      servicio = widget.DatosAlumno['telefono'];
      fechainicio = widget.DatosAlumno['fechainicio'];
    }
  }

  static const menuItems = <String>[
    'TECNM',
    'CONALEP',
    'CBTIS 81',
    'COBACH',
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
  String _btn1SelectedVal = 'TECNM';
  String _btn2SelectedVal;
  String _btn3SelectedVal;

  static const menuItems2 = <String>[
    'Centro de cómputo',
    'Biblioteca',
    'otro',
    'Otro',
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems2 = menuItems2
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  final List<PopupMenuItem<String>> _popUpMenuItems2 = menuItems2
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  String _btn1SelectedVal2 = 'Biblioteca';
  String _btn2SelectedVal2;
  String _btn3SelectedVal2;

  static const menuItems3 = <String>[
    'Contador Público',
    'Licenciatura en Administración',
    'Ingeniería Civil',
    'Ingeniería en Electrónica',
    'Ingeniería en Gestión Empresarial',
    'Ingeniería Industrial',
    'Ingeniería en Sistemas Computacionales',
    'Ingeniería Mecatrónica'
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems3 = menuItems3
      .map(
        (String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();
  final List<PopupMenuItem<String>> _popUpMenuItems3 = menuItems3
      .map(
        (String value) => PopupMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();
  String _btn1SelectedVal3 = 'Biblioteca';
  String _btn2SelectedVal3;
  String _btn3SelectedVal3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar nuevo alumno'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
                child: Text(
                  'Llene el formulario para dar de alta a un nuevo alumno',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: numcontrolC,
                    onChanged: (value) {
                      setState(() {
                        numcontrol = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Número de control',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: nombreC,
                    onChanged: (value) {
                      setState(() {
                        nombre = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: apaternoC,
                    onChanged: (value) {
                      setState(() {
                        apaterno = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Apellido Paterno',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: amaternoC,
                    onChanged: (value) {
                      setState(() {
                        amaterno = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Apellido Materno',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    title: const Text('Escuela'),
                    trailing: DropdownButton(
                      value: _btn2SelectedVal,
                      hint: const Text('Elegir'),
                      onChanged: (String newValue) {
                        setState(() {
                          _btn2SelectedVal = newValue;
                          escuela = newValue;
                        });
                      },
                      items: _dropDownMenuItems,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    title: const Text('Carrera'),
                    trailing: DropdownButton(
                      value: _btn2SelectedVal3,
                      hint: const Text('Elegir'),
                      onChanged: (String newValue) {
                        setState(() {
                          _btn2SelectedVal3 = newValue;
                          carrera = newValue;
                        });
                      },
                      items: _dropDownMenuItems3,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    maxLength: 2,
                    controller: semestreC,
                    onChanged: (value) {
                      setState(() {
                        semestre = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Semestre',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: hrstotalesC,
                    onChanged: (value) {
                      setState(() {
                        hrstotales = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Horas a realizar',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    title: const Text('Área de servicio social'),
                    trailing: DropdownButton(
                      value: _btn2SelectedVal2,
                      hint: const Text('Elegir'),
                      onChanged: (String newValue) {
                        setState(() {
                          _btn2SelectedVal2 = newValue;
                          servicio = newValue;
                        });
                      },
                      items: _dropDownMenuItems2,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              maxLength: 10,
              controller: telefonoC,
              onChanged: (value) {
                setState(() {
                  telefono = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Teléfono',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Container(
            width: 150,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ElevatedButton(
              child: Text('Elegir fecha de inicio'),
              onPressed: () async {
                final DateTime newDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2021, 12, 1),
                  firstDate: DateTime(2020, 1),
                  lastDate: DateTime(2030, 7),
                  helpText: 'Fecha de inicio',
                );
                setState(() {
                  fechainicio = Timestamp.fromMillisecondsSinceEpoch(
                      newDate.millisecondsSinceEpoch);
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            width: 60,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ElevatedButton(
              child: Text('Agregar'),
              onPressed: () {
                FirebaseFirestore.instance.collection('alumnos').doc().set({
                  'nocontrol': numcontrol,
                  'nombre': nombre,
                  'apaterno': apaterno,
                  'amaterno': amaterno,
                  'escuela': escuela,
                  'carrera': carrera,
                  'semestre': semestre,
                  'hrstotales': hrstotales,
                  'servicio': servicio,
                  'fechainicio': fechainicio,
                  'activo': activo
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
