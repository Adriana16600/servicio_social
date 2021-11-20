import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({Key key}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  String numcontrol = '',
      nombre = '',
      apaterno = '',
      amaterno = '',
      escuela = '',
      carrera = '',
      semestre = '',
      hrstotales = '',
      fechainicio = '';
  bool activo=true;

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
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    numcontrol = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Número de control',
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        nombre = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        apaterno = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Apellido Paterno',
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        amaterno = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Apellido Materno',
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
                    onChanged: (value) {
                      setState(() {
                        escuela = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Escuela',
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        carrera = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Carrera',
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        semestre = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Semestre',
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  hrstotales = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Horas a realizar',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  fechainicio = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Fecha de inicio',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 60,
              child: ElevatedButton(
                child: Text('Agregar'),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('alumnos')
                  .doc()
                      .set({
                    'nocontrol':numcontrol, 'nombre':nombre, 'apaterno':apaterno, 'amaterno':amaterno, 'escuela':escuela, 'carrera':carrera,
                    'semestre':semestre, 'hrstotales':hrstotales, 'fechainicio':Timestamp.now(), 'activo':activo
                  });
                  Navigator.push(context,MaterialPageRoute(builder: (context) => RegistroPage(),));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
