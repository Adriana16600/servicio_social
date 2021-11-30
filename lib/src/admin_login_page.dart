import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servicio_social/src/admi_page.dart';
import 'package:servicio_social/src/welcome_page.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key key}) : super(key: key);

  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    bool passwordVisibility = true;

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(

        title: Text('Entrando al modo administrador'),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image(
                image: NetworkImage(
                    'http://www.huatabampo.tecnm.mx/wp-content/uploads/2019/09/TecNM-logo-216x300.png'),
                height: 500,
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_circle_rounded,
                        size: 100,
                      ),
                      Text('Administrador',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Theme.of(context).colorScheme.onSurface)),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Usuario',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(
                          Icons.person_rounded,
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) return 'Inserte un usuario válido';
                        return null;
                      },
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Nip',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: const Icon(
                          Icons.password_rounded,
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) return 'Inserte una contraseña';
                        return null;
                      },
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    child: Text('Entrar'),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => TablaAlumnos(),));
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
          ],
        ),
      ),
    );
  }

  Future<void> singIn(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('El usuario no existe');
      } else if (e.code == 'wrong-password') {
        print('La contraseña es incorrecta');
      }
    }
  }
}
