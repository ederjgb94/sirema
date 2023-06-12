import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sirema/constantes/rutas.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: '/',
    );
  }
}
