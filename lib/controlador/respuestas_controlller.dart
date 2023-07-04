import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class RespuestasController {
  static String uid = '';
  String getUid() {
    return uid;
  }

  void generarRegistroRespuestas(
    int correctas,
    int incorrectas,
    int total,
    String type,
  ) {
    var db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user.uid;
    }
    final res = <String, dynamic>{
      "correctas": correctas,
      "incorrectas": incorrectas,
      "total": total,
      "date": DateTime.now(),
    };

    db.collection("estudiantes").doc(uid).collection(type).add(res);
  }

  Future<void> loginWithGoogleFirebase() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // checkUser();
  }

  Future<void> logoutGoogle() async {
    await FirebaseAuth.instance.signOut();
  }

  //checar el User logeado
  void checkUser() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user.uid;
    }
  }

  void crearPerfil(uid, email, name, age, type) {
    var db = FirebaseFirestore.instance;
    db.collection('estudiantes').doc(uid).set({
      'email': email,
      'name': name,
      'age': age,
      'type': type,
    }).whenComplete(() {
      if (kDebugMode) print('yes');
    });
  }

  Future<bool> checarPerfil() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user.uid;
    }
    var db = FirebaseFirestore.instance;
    var doc = await db.collection('estudiantes').doc(uid).get();
    return doc.data()?['age'] != null;
    //     .then((DocumentSnapshot documentSnapshot) {
    //   if (documentSnapshot.exists) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // });
  }
}
