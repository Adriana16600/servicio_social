import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servicio_social/src/student_view.dart';

import 'firebase/firebase.dart';
import 'admin_login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String control = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/project-sahuaro.appspot.com/o/school%2Fedificio_j.jpg?alt=media&token=75b28777-33e7-4cc9-ab6f-fc5f8d9e6d94',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 550,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        // controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            control = value;
                          });
                        },
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          labelText: 'Numero de Control',
                          labelStyle: Theme.of(context).textTheme.headline6,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminLoginPage(),
                                    ));
                              },
                              child: Text('Entrar como administrador')),
                          ElevatedButton(
                            onPressed: control != ''
                                ? () {
                                    FirebaseFirestore.instance
                                        .collection('alumnos')
                                        .where('nocontrol', isEqualTo: control)
                                        .get()
                                        .then((value) {
                                      print('$value');
                                      if (value.docs.isNotEmpty) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => StudentPage(
                                                alumno: value.docs[0],
                                              ),
                                            ));
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Oops'),
                                              content: Text(
                                                  'Este usuario no existe'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('OK'))
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    });
                                  }
                                : null,
                            child: const Text('Entrar'),
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).colorScheme.primary,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                textStyle:
                                    Theme.of(context).textTheme.headline6),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Este usuario no existe'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
