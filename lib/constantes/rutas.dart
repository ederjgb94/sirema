import 'package:flutter/material.dart';
import 'package:sirema/vistas/ejercicios_restas.dart';
import 'package:sirema/vistas/ejercicios_sumas.dart';
import 'package:sirema/vistas/inicio.dart';
import 'package:sirema/vistas/seleccionar_ejercicio_page.dart';

Map<String, WidgetBuilder> rutas = {
  '/': (context) => const InicioPage(),
  '/seleccionar_ejercicios': (context) => const SeleccionarEjercicioPage(),
  '/ejercicios_sumas': (context) => const EjerciciosSumasPage(),
  '/ejercicios_restas': (context) => const EjerciciosRestasPage(),
};
