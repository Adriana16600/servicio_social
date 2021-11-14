import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servicio_social/src/homepage.dart';

import 'src/theme/theme.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      print('$e');
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return MaterialApp(home: Container(child: Text('Error')));
    }

    if (!_initialized) {
      return MaterialApp(home: Container(child: Text('Not init')));
    }

    return MaterialApp(
      title: 'Servicio',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.define(),
      home: HomePage(),
    );
  }
}