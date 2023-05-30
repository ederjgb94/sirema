import 'package:flutter/material.dart';
import 'package:sirema/vistas/ejercicios_sumas.dart';
import 'package:sirema/vistas/seleccionar_ejercicio_page.dart';

Map<String, WidgetBuilder> rutas = {
  '/': (context) => const SeleccionarEjercicioPage(),
  '/ejercicios_sumas': (context) => const EjerciciosSumasPage(),
};
