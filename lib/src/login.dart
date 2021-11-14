import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:servicio_social/src/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    bool passwordVisibility = true;


    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();


    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Image(
                image: NetworkImage(
                    'http://www.huatabampo.tecnm.mx/wp-content/uploads/2019/09/TecNM-logo-216x300.png'),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Icon(Icons.person, size: 100,),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Icon(Icons.person, size: 100,),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }


  Future<void> singIn(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {

        print('Wrong password provided for that user.');
      }
    }

  }

}
