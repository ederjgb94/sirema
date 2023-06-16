import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sirema/constantes/rutas.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCDJnQqd8y5W_YF-p5rIlo4Os_QFA-t7KA",
        authDomain: "sirema-web.firebaseapp.com",
        projectId: "sirema-web",
        storageBucket: "sirema-web.appspot.com",
        messagingSenderId: "768607032178",
        appId: "1:768607032178:web:32bc10466284f2c51e43eb",
        measurementId: "G-HP1GBYMCDN"),
  );

  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: '6LfjCoUmAAAAAG-q8UVAPrnSnTg7BF4jnNzAHXCK',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Este widget es la raíz de su aplicación.
  /// aquí se inyectan las rutas de la aplicación y se define la ruta inicial
  /// para que se muestre al iniciar la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIREMA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: rutas, //se injectan las rutas
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? '/'
          : '/login', //se define la ruta inicial
    );
  }
}
