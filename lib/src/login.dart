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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
          alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 200,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Administrador',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface)),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(
                        Icons.alternate_email_rounded,
                      ),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) return 'Please enter some text';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                  child: TextFormField(

                    obscureText: passwordVisibility,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisibility = !passwordVisibility;
                          });
                        },
                        icon: passwordVisibility
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) return 'Please enter some text';
                      return null;
                    },

                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  width: MediaQuery.of(context).size.width,
                  child:
                  ElevatedButton(
                    child: Text('Entrar'),
                    onPressed: () {
                      singIn(_emailController.text, _passwordController.text);
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
          ),
        ],
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
