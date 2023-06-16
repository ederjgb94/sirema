import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RespuestasController {
  static String uid = '';
  String getUid() {
    return uid;
  }

  void generarRegistroRespuestas(int correctas, int incorrectas, int total) {
    var db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user.uid;
    }
    final estudiante = <String, dynamic>{
      "id": uid,
      "correctas": correctas,
      "incorrectas": incorrectas,
      "total": total,
    };

    db.collection("estudiantes").add(estudiante);
  }

  Future<void> loginWithGoogleFirebase() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // checkUser();
  }

  void logoutGoogle() {
    FirebaseAuth.instance.signOut();
  }

  //checar el User logeado
  void checkUser() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user.uid;
    }
  }
}
