import 'package:flutter/material.dart';
import 'package:sirema/vistas/discalculia_page.dart';
import 'package:sirema/vistas/ejercicios_restas.dart';
import 'package:sirema/vistas/ejercicios_sumas.dart';
import 'package:sirema/vistas/inicio.dart';
import 'package:sirema/vistas/login_page.dart';
import 'package:sirema/vistas/misionvision_page.dart';
import 'package:sirema/vistas/objetivo_enelservicio.dart';
import 'package:sirema/vistas/quienessomos_page.dart';
import 'package:sirema/vistas/seleccionar_ejercicio_page.dart';

Map<String, WidgetBuilder> rutas = {
  '/': (context) => const InicioPage(),
  '/seleccionar_ejercicios': (context) => const SeleccionarEjercicioPage(),
  '/ejercicios_sumas': (context) => const EjerciciosSumasPage(),
  '/ejercicios_restas': (context) => const EjerciciosRestasPage(),
  '/objetivo_en_el_servicio': (context) => const ObjetivoEnElServicio(),
  '/discalculia': (context) => const DiscalculiaPage(),
  '/misionvision': (context) => const MisionVisionPage(),
  '/quienes_somos': (context) => const QuienesSomosPage(),
  '/login': (context) => const LoginPage(),
};
