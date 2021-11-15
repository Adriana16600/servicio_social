import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'firebase/firebase.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FireBridge fire = new FireBridge();

    TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.center,
            height: 90,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  child: Text('TECNM Agua Prieta', style: Theme.of(context).textTheme.headline1.copyWith(color: Theme.of(context).colorScheme.surface),),
                  alignment: Alignment.center,
                ),
                Container(
                  height: 150,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text(
                            'Inicio',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary),
                          ),

                        ),
                        height: 150,
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text(
                            'Historial',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary),
                          ),

                        ),
                        height: 150,
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text(
                            'Reportes',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary),
                          ),

                        ),
                        height: 150,
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );


                          },
                          child: Text(
                            'Administrador',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary),
                          ),

                        ),
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -150,
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        //color: Theme.of(context).colorScheme.primary,
                        width: 550,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, bottom: 20, top: 20),
                          child: TextFormField(
                            controller: _controller,
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary),
                            decoration: InputDecoration(
                              icon: const Icon(Icons.person),
                              labelText: 'Numero de Control',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        decoration:  BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(10) //                 <--- border radius here
                          ),
                        ),

                      ),
                      const SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('alumnos')
                                  .where("nocontrol",
                                  isEqualTo: _controller.text)
                                  .get()
                                  .then((value) {
                                if (value.docs.isNotEmpty) {
                                  print('${value.docs[0].id}');
                                  fire.addfechaentrada(value.docs[0].id);
                                } else {
                                  _showMyDialog();
                                }
                              });


                            },
                            child: const Text('Entrada'),
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).colorScheme.primary,
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                textStyle:Theme.of(context).textTheme.headline6

                            ),
                          ),
                          const SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {

                            },
                            child: const Text('Salida'),
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).colorScheme.primary,
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                textStyle:Theme.of(context).textTheme.headline6

                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
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
