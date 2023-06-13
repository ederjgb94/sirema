import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void prueba() {
  var db = FirebaseFirestore.instance;
  // Create a new user with a first and last name
  final estudiante = <String, dynamic>{
    "id": "google-id",
    "correctas": "54",
    "incorrectas": "54",
    "total": 10,
  };

// Add a new document with a generated ID
  db.collection("estudiantes").add(estudiante).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));
  print('pase');
}

void loginWithGoogleFirebase() {
  GoogleAuthProvider googleProvider = GoogleAuthProvider();
  FirebaseAuth.instance.signInWithPopup(googleProvider).then((value) {
    print(value.user);
  }).catchError((onError) {
    print(onError);
  });
}
