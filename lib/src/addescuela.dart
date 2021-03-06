import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:servicio_social/src/ver_escuelas.dart';

class AddEscuela extends StatefulWidget {
  final DocumentSnapshot DatosAlumno;
  const AddEscuela({Key key, this.DatosAlumno}) : super(key: key);

  @override
  _AddEscuelaState createState() => _AddEscuelaState();
}

class _AddEscuelaState extends State<AddEscuela> {
  String escuelaname = '',
      horas = '',
      direccion='',
      telefono='';
  bool activo=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar escuela'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
                child: Text(
                  'Llene el formulario para dar de alta una nueva escuela',
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
                    onChanged: (value) {
                      setState(() {
                        escuelaname = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Escuela',
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
                    onChanged: (value) {
                      setState(() {
                        direccion = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Direcci??n',
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
                    onChanged: (value) {
                      setState(() {
                        telefono = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Tel??fono',
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
                    onChanged: (value) {
                      setState(() {
                        horas = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Horas de servicio social',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
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
                    FirebaseFirestore.instance.collection('escuelas').doc().set({
                      'escuelaname': escuelaname,
                      'horas': horas,
                      'direccion': direccion,
                      'telefono': telefono,
                      'activo': activo
                    });
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                              'Agregado'),
                          content: Text(
                              'Consulte en la pesta??a Agregar escuelas > Ver lista de escuelas'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        //DatosAlumno: snapshot.data.docs[index],
                                        AddEscuela(),
                                      ));
                                },
                                child: Text('OK'))
                          ],
                        );
                      },
                    );
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
                            builder: (context) => VerEscuelas(),
                          ));
                    },
                    child: Text('Ver lista de escuelas')),
              ],
            )
          //)
        ],
      ),
    );
  }
}
