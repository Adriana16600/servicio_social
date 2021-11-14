import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.center,
            height: 150,
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
                          padding: EdgeInsets.only(
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
                              icon: Icon(Icons.person),
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
                          borderRadius: BorderRadius.all(
                              Radius.circular(10) //                 <--- border radius here
                          ),
                        ),

                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                            },
                            child: Text('Aceptar'),
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).colorScheme.primary,
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                textStyle:Theme.of(context).textTheme.headline6

                            ),
                          ),
                          SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {

                            },
                            child: Text('Borrar'),
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
}
