import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'firebase/firebase.dart';

class add extends StatefulWidget {
  const add({Key key}) : super(key: key);

  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {
  bool visibilityCont = false;

  void _changed(bool visibility) {
    setState(() {
      visibilityCont = visibility;
    });
  }

  TextEditingController _cant = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Usuario'),
        centerTitle: true,
        titleTextStyle: Theme
            .of(context)
            .textTheme
            .headline4,
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .surface,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              child: Row(
                children: [
                  Text(
                    'Cantidad de alumnos',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  Container(
                    width: 100,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                      child: TextFormField(
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle1,
                        controller: _cant,
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (String value) {
                          if (value.isEmpty)
                            return 'No se puede dejar vacío este campo';
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        visibilityCont ? null : _changed(true);
                      },
                      child: Text('Aceptar'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height -
                  (MediaQuery
                      .of(context)
                      .size
                      .height / 7 + 120),
              width: MediaQuery
                  .of(context)
                  .size
                  .width -
                  (MediaQuery
                      .of(context)
                      .size
                      .height / 7) - 200,
              child: visibilityCont
                  ? CartInsert(cant: int.parse(_cant.text))
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class CartInsert extends StatefulWidget {
  const CartInsert({Key key, this.cant}) : super(key: key);

  final int cant;

  @override
  _CartInsertState createState() => _CartInsertState();
}

class _CartInsertState extends State<CartInsert> {
  bool visibilityCont = false;

  void _changed(bool visibility) {
    setState(() {
      visibilityCont = visibility;
    });
  }


  String dropCarrera = 'Contador Público';
  String dropEscuela = 'TECNM';
  String dropArea = 'Centro de cómputo';
  final format = DateFormat("dd-MM-yyyy");

  var dataList;
  var dataList1;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nocontrol = TextEditingController();
    final TextEditingController _nombre = TextEditingController();
    final TextEditingController _apaterno = TextEditingController();
    final TextEditingController _amaterno = TextEditingController();
    final TextEditingController _escuela = TextEditingController();
    final TextEditingController _carrera = TextEditingController();
    final TextEditingController _semestre = TextEditingController();
    final TextEditingController _hrstotales = TextEditingController();
    final TextEditingController _telefono = TextEditingController();
    final TextEditingController _servicio = TextEditingController();
    final TextEditingController _fechainicio = TextEditingController();
    final TextEditingController _activo = TextEditingController();

    void clear() {
      String dropCarrera = 'Contador Público';
      String dropEscuela = 'TECNM';
      String dropArea = 'Centro de cómputo';
      _nocontrol.clear();
      _nombre.clear();
      _apaterno.clear();
      _amaterno.clear();
      _escuela.clear();
      _carrera.clear();
      _semestre.clear();
      _hrstotales.clear();
      _telefono.clear();
      _servicio.clear();
      _fechainicio.clear();
      _activo.clear();
    }

    int cont = 0;

    dataList = List.generate(widget.cant,
            (i) =>
        [
          '---',
          '---',
          '---',
          '---',
          '---',
          '---',
          '---',
          '---',
          '---'
        ],
        growable: false);

    @override
    void initState() {
      super.initState();
      dataList1;
    }

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: MediaQuery
                    .of(context)
                    .size
                    .width -
                    (200 + MediaQuery
                        .of(context)
                        .size
                        .height / 7) - 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          value: dropCarrera,
                          onChanged: (String newValue) {
                            setState(() {
                              dropCarrera = newValue;
                            });
                          },
                          items: <String>['Contador Público',
                            'Licenciatura en Administración',
                            'Ingeniería en Electrónica',
                            'Ingeniería en Sistemas Computacionales',
                            'Ingeniería Industrial',
                            'Ingeniería en Mecatrónica',
                            'Ingeniería en Gestión Empresarial',
                            'Ingeniería Civil']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(color: Colors.black54),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          value: dropEscuela,
                          onChanged: (String newValue) {
                            setState(() {
                              dropEscuela = newValue;
                            });
                          },
                          items: <String>['TECNM', 'CONALEP','COBACH','CBTIS 81']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(color: Colors.black54),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          value: dropArea,
                          onChanged: (String newValue) {
                            setState(() {
                              dropArea = newValue;
                            });
                          },
                          items: <String>['Centro de Cómputo', 'Biblioteca','otro','Otro']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(color: Colors.black54),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          value: dropCarrera,
                          onChanged: (String newValue) {
                            setState(() {
                              dropCarrera = newValue;
                            });
                          },
                          items: <String>[
                            'Contador Público',
                            'Licenciatura en Administración',
                            'Ingeniería en Electrónica',
                            'Ingeniería en Sistemas Computacionales',
                            'Ingeniería Industrial',
                            'Ingeniería en Mecatrónica',
                            'Ingeniería en Gestión Empresarial',
                            'Ingeniería Civil'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(color: Colors.black54),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                        child: TextFormField(
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1,
                          controller: _nocontrol,
                          textCapitalization: TextCapitalization.characters,
                          decoration: InputDecoration(
                            labelText: 'Número de control',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'Ingrese los datos';
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                        child: TextFormField(
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1,
                          controller: _nombre,
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'Ingrese los datos';
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                        child: TextFormField(
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1,
                          controller: _apaterno,
                          decoration: InputDecoration(
                            labelText: 'Apellido Paterno',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'Ingrese los datos';
                            return null;
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                        child: TextFormField(
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1,
                          controller: _amaterno,
                          decoration: InputDecoration(
                            labelText: 'Apellido Materno',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'Ingrese los datos';
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                width: 120,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      if (cont == widget.cant) {}
                      if (cont < widget.cant) {
                        dataList[cont][0] = dropEscuela;
                        dataList[cont][1] = dropCarrera;
                        dataList[cont][2] = dropArea;
                        dataList[cont][3] = _nocontrol.text;
                        dataList[cont][4] = _nombre.text;
                        dataList[cont][5] = _apaterno.text;
                        dataList[cont][6] = _amaterno.text;
                        dataList[cont][7] = _escuela.text;
                        dataList[cont][8] = _carrera.text;
                        dataList[cont][9] = _semestre.text;
                        dataList[cont][10] = _hrstotales.text;
                        if (cont == widget.cant - 1) {
                          _changed(true);
                          clear();
                          setState(() {
                            dataList1 = dataList;
                          });
                        }
                        cont++;
                      } else {
                        cont++;
                      }
                    },
                    child: Text('Agregar'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 500,
            width: MediaQuery
                .of(context)
                .size
                .width -
                (MediaQuery
                    .of(context)
                    .size
                    .height / 7),
            child: visibilityCont
                ? Container(
              child: VerArray(
                datalist: dataList1,
              ),
            )
                : Container(),
          ),
          Container(
            height: 100,
            width: MediaQuery
                .of(context)
                .size
                .width -
                (MediaQuery
                    .of(context)
                    .size
                    .height / 7),
            child: visibilityCont
                ? Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
              child: ElevatedButton(
                onPressed: () {
                  print('${dataList1.length}');
                  createUser(dataList1);
                },
                child: Text('Guardar'),
              ),
            )
                : Container(),
          ),
        ],
      ),
    );
  }

  Future<bool> createUser(var array) {
    for (int x = 0; x < array.length; x++) {
      FirebaseFirestore.instance
          .collection('alumnos')
          .doc()
          .set({
        'nocontrol': array[x][4],
        'nombre': array[x][6],
        'apaterno': array[x][5],
        'amaterno': array[x][2],
        'escuela': array[x][7],
        'carrera': array[x][8],
        'semestre': array[x][3],
        'hrstotales': array[x][1],
        'servicio': array[x][0],
        'fechainicio': array[x][],
        'activo': array[x][]
      })
          .then((value) => true)
          .onError((error, stackTrace) => false);
    }
  }


}

class VerArray extends StatefulWidget {
  const VerArray({Key key, this.datalist}) : super(key: key);
  final datalist;

  @override
  _VerArrayState createState() => _VerArrayState();
}

class _VerArrayState extends State<VerArray> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Theme
              .of(context)
              .colorScheme
              .secondaryVariant,
          height: 1000,
          width: MediaQuery
              .of(context)
              .size
              .width - 165,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.datalist.length,
            itemBuilder: (context, index) =>
                Row(
                  children: [
                    Container(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width - (165)) / 10,
                      child: Card(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        child: Text(
                          widget.datalist[index][0],
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        shadowColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                    Container(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width - (165)) / 10,
                      child: Card(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        child: Text(
                          widget.datalist[index][1],
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        shadowColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                    Container(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width - (165)) / 10,
                      child: Card(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        child: Text(
                          widget.datalist[index][2],
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        shadowColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                    Container(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width - (165)) / 10,
                      child: Card(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        child: Text(
                          widget.datalist[index][3],
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        shadowColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                    Container(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width - (165)) / 10,
                      child: Card(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        child: Text(
                          widget.datalist[index][4],
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        shadowColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                    Container(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width - (165)) / 10,
                      child: Card(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        child: Text(
                          widget.datalist[index][5],
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        shadowColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                    Container(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width - (165)) / 10,
                      child: Card(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        child: Text(
                          widget.datalist[index][6],
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        shadowColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                    Container(
                      width: ((MediaQuery
                          .of(context)
                          .size
                          .width - (165)) / 10) * 2,
                      child: Card(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        child: Text(
                          widget.datalist[index][7],
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        shadowColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                    Container(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width - (165)) / 10,
                      child: Card(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface,
                        child: Text(
                          widget.datalist[index][8],
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
                        ),
                        shadowColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                  ],
                ),
          ),
        ));
  }
}
