
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBridge {

  Future<bool> addfechaentrada(String id) {
    return FirebaseFirestore.instance
        .collection('alumnos')
        .doc(id)
    .collection('registros')
    .doc()
        .set({
      'entrada': Timestamp.now(),
    })
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }



}