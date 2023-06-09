import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    int x = random.nextInt(3);
    var s1 = a == 1 ? "" : "s";
    var s2 = b == 1 ? "" : "s";
    switch (x) {
      case 0:
        return "Si tengo $a figurita$s1 y mi mamá me compra $b figurita$s2, ¿Cuántas figuritas tengo en total?";
      case 1:
        return "Mi papá me dió $a pegatina$s1 y mi mamá me dió $b pegatina$s2, ¿Cuántas pegatinas tengo en total?";
      case 2:
        return "Mi amigo Pepe tiene $a estampa$s1 y mi amigo Juan tiene $b estampa$s2, ¿Si juntamos las estampas cuántas serían en total?";
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
                            (ejercicios[index].first + ejercicios[index].second)
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
    );
  }

  bool enviado = false;

  Future<void> enviarResultadoFirebase() async {
    if (enviado) {
      return;
    }
    await Future.delayed(const Duration(seconds: 1));
    enviado = true;
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
                          int correctas = 0;
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
                          int incorrectas = total - correctas;
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
                );
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
              future: enviarResultadoFirebase(),
            ),
    );
  }
}
