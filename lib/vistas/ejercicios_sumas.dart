import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:sirema/controlador/respuestas_controlller.dart';
import 'package:sirema/utilerias/pair.dart';
import 'package:text_to_speech/text_to_speech.dart';

class EjerciciosSumasPage extends StatefulWidget {
  const EjerciciosSumasPage({super.key});

  @override
  State<EjerciciosSumasPage> createState() => _EjerciciosSumasPageState();
}

class _EjerciciosSumasPageState extends State<EjerciciosSumasPage> {
  final Random random = Random();

  final List<String> imagenes = [
    'arbol',
    'buho',
    'caracol',
    'fresa',
    'lapiz',
    'libro',
    'mango',
    'manzana',
    'platano',
    'sandia',
    'zanahoria',
    'avion',
    'avioneta',
    'barco',
    'camion',
    'canoa',
    'carrito',
    'cohete',
    'helicoptero',
    'juguete',
    'muneca',
    'patito',
    'pelota',
    'robot',
    'tambor',
    'trex',
    'trompo',
  ];

  final List<TextEditingController> respuestas =
      List.generate(10, (index) => TextEditingController());

  List<Pair> ejercicios = [];

  List<bool> respuestasCorrectas = [];

  List<String> oraciones = [];

  List<List<int>> imgG1 = [];
  List<List<int>> imgG2 = [];

  bool verificar = false;

  @override
  void initState() {
    respuestasCorrectas = List.generate(10, (index) => false);
    ejercicios = List.generate(10, (index) {
      int x = (random.nextInt(12)) + 1;
      int y = (random.nextInt(12)) + 1;

      imgG1.add(List.generate(x, (index) => random.nextInt(imagenes.length)));
      imgG2.add(List.generate(y, (index) => random.nextInt(imagenes.length)));

      oraciones.add(generarOracion(x, y));
      return Pair(
        x,
        y,
      );
    });
    super.initState();
  }

  String generarOracion(int a, int b) {
    int x = random.nextInt(7);
    var s1 = a == 1 ? "" : "s";
    var s2 = b == 1 ? "" : "s";
    switch (x) {
      case 0:
        return "Si tengo $a figurita$s1 y mi mamá me compra $b figurita$s2, ¿Cuántas figuritas tengo en total?";
      case 1:
        return "Mi papá me dió $a pegatina$s1 y mi mamá me dió $b pegatina$s2, ¿Cuántas pegatinas tengo en total?";
      case 2:
        return "Mi amigo Pepe tiene $a estampa$s1 y mi amigo Juan tiene $b estampa$s2, ¿Si juntamos las estampas cuántas serían en total?";
      case 3:
        return "Mi amigo Pepe tiene $a estampa$s1 y mi amigo Juan tiene $b estampa$s2, ¿Si juntamos las estampas cuántas serían en total?";
      case 4:
        return "Mi tío me regaló $a estampa$s1 y mi tía me regaló $b estampa$s2, ¿Cuantas estampas tengo en total?";
      case 5:
        return "Mi primo Beto llego a mi casa con $a figuras y mi mama me regalo $b figuras, ¿Cuantas figuras tenemos en total?";
      case 6:
        return "Mi maestro pidio que trajeramos $a pegatina$s1 y mi maestra pidio que trajeramos $b pegatina$s2, ¿Cuantas pegatinas tengo que traer a la escuela?";
    }
    return "";
  }

  Widget generarSuma(
    context,
    index,
  ) {
    int a = ejercicios[index].first;
    int b = ejercicios[index].second;
    return Container(
      // color: Colors.red,
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      constraints: const BoxConstraints(
        maxWidth: 1200,
      ),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.teal,
                  width: 2,
                ),
              ),
              width: 300,
              child: Wrap(
                children: List.generate(
                  (a + 1),
                  (subindex) {
                    return subindex == 0
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              a.toString(),
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Image.asset(
                            'assets/${imagenes[imgG1[index][subindex - 1]]}.png',
                            width: 60,
                            height: 60,
                          );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Image.asset('assets/sumaicono.png', width: 80, height: 80),
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.teal,
                  width: 2,
                ),
              ),
              child: Wrap(
                children: List.generate(
                  (b + 1),
                  (subindex) {
                    return subindex == 0
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              b.toString(),
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Image.asset(
                            'assets/${imagenes[imgG2[index][subindex - 1]]}.png',
                            width: 60,
                            height: 60,
                          );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset('assets/igualicono.png', width: 80, height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/nube.png', width: 120, height: 120),
                  Container(
                    decoration: verificar && respuestasCorrectas[index] == false
                        ? BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                            ),
                          )
                        : const BoxDecoration(),
                    width: 50,
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      controller: respuestas[index],
                      maxLength: 2,
                      readOnly: verificar,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 167, 99),
                      ),
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  verificar == false
                      ? const SizedBox()
                      : respuestasCorrectas[index] == false
                          ? Positioned(
                              right: -20,
                              bottom: 5,
                              child: Image.asset('assets/equis.png',
                                  width: 60, height: 60),
                            )
                          : Positioned(
                              right: -20,
                              bottom: 5,
                              child: Image.asset('assets/palomita.png',
                                  width: 60, height: 60),
                            ),
                  verificar && respuestasCorrectas[index] == false
                      ? Positioned(
                          bottom: 5,
                          right: -70,
                          child: Container(
                            color: Colors.white,
                            child: Text(
                              (ejercicios[index].first +
                                      ejercicios[index].second)
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                TextToSpeech tts = TextToSpeech();
                await tts.setLanguage("es-MX");
                await tts.setRate(0.9);
                // String text =
                //     "Si tengo $a figuritas y mi mama me compra $b figuritas, ¿Cuántas figuritas tengo en total?";
                tts.speak(oraciones[index]);
              },
              child: Image.asset(
                'assets/escuchar_audio.png',
                scale: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool enviado = false;
  int correctas = 0;
  int incorrectas = 0;

  Future<void> enviarResultadoFirebase(context) async {
    if (enviado) {
      return;
    }

    await Future.delayed(const Duration(seconds: 1));
    enviado = true;

    RespuestasController().generarRegistroRespuestas(
      correctas,
      incorrectas,
      ejercicios.length,
      'ejercicios_sumas',
    );
  }

  void muestraResultados() {
    String msg = '';
    msg = correctas == 10
        ? '¡Excelente! haz contestado todos los ejercicios correctamente'
        : correctas >= 8
            ? '¡Felicidades! lo hiciste muy bien'
            : '¡Sigue intentando! lo harás mejor la próxima vez';

    String lotti = correctas == 10
        ? 'ganador.json'
        : correctas >= 8
            ? 'animate_fruit.json'
            : 'banana.json';
    String userAgent = window.navigator.userAgent.toLowerCase();
    bool isMobile = userAgent.contains('mobile');

    Dialogs.bottomMaterialDialog(
        msg: msg,
        title: 'Tus respuestas correctas $correctas de ${ejercicios.length}',
        color: Colors.white,
        context: context,
        customView: isMobile
            ? const SizedBox()
            : Container(
                color: const Color(0xffF7F5FB),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xffF7F5FB),
                    BlendMode.modulate,
                  ),
                  child: Lottie.asset(
                    'assets/$lotti',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Ver resultados',
            iconData: Icons.visibility,
            color: Colors.teal,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 230, 230),
        title: Image.asset('assets/sirema.png', scale: 4),
        centerTitle: true,
        toolbarHeight: 100,
        leading: SizedBox(
          height: 48,
          width: 48,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/seleccionar_ejercicios');
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.start,
              alignment: WrapAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.white,
                  child: Image.asset(
                    'assets/ejerciciosSuma.png',
                    scale: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'OBSERVA Y CONTESTA CORRECTAMENTE LAS SIGUIENTES SUMAS:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: List.generate(
                    10,
                    (index) => generarSuma(context, index),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: verificar == false
          ? GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      '¿ACABASTE?',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'NO',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            verificar = true;
                          });
                          Navigator.pop(context);

                          int total = ejercicios.length;
                          correctas = 0;
                          for (int i = 0; i < ejercicios.length; i++) {
                            var ejercicio = ejercicios[i];
                            int a = ejercicio.first;
                            int b = ejercicio.second;
                            int res = respuestas[i].text == ''
                                ? 0
                                : int.parse(respuestas[i].text);

                            if (a + b == res) {
                              correctas++;
                              respuestasCorrectas[i] = true;
                            }
                          }
                          incorrectas = total - correctas;
                        },
                        child: const Text(
                          'SI',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).whenComplete(() {
                  if (verificar) {
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      muestraResultados();
                    });
                  }
                });
              },
              child: Image.asset(
                'assets/verificar.png',
                scale: 1.5,
              ),
            )
          : FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/seleccionar_ejercicios');
                    },
                    child: Image.asset(
                      'assets/finalizar.png',
                      scale: 2.5,
                    ),
                  );
                } else {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/boton_vacio.png',
                        scale: 3,
                      ),
                      const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ],
                  );
                }
              },
              future: enviarResultadoFirebase(context),
            ),
    );
  }
}
