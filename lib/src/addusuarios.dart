import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:servicio_social/src/ver_usuarios.dart';

class AddUsuarios extends StatefulWidget {
  final DocumentSnapshot DatosAlumno;
  const AddUsuarios({Key key, this.DatosAlumno}) : super(key: key);

  @override
  _AddUsuariosState createState() => _AddUsuariosState();
}

class _AddUsuariosState extends State<AddUsuarios> {
  String usuarioname = '',
      usuario = '',
      clave='';
  bool activo=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar usuario'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
                child: Text(
                  'Llene el formulario para dar de alta un nuevo usuario',
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
                        usuarioname = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Nombre del usuario',
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
                        usuario = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Usuario',
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
                        clave = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'NIP',
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
                  FirebaseFirestore.instance.collection('usuarios').doc().set({
                    'nombre': usuarioname,
                    'usuario':usuario,
                    'nip':clave,
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
                          builder: (context) => VerUsuarios(),
                        ));
                  },
                  child: Text('Ver lista de usuarios')),
            ],
          )

        ],
      ),
    );
  }
}